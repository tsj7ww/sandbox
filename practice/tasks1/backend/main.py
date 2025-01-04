from fastapi import FastAPI, UploadFile, File, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, Column, Integer, String, DateTime, text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from motor.motor_asyncio import AsyncIOMotorClient
from datetime import datetime
import os
import time
import logging
from typing import Optional, List
from pydantic import BaseModel, ConfigDict
from contextlib import contextmanager
from minio import Minio
from functools import lru_cache

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Environment variable validation
def get_env_variable(var_name: str) -> str:
    """Get environment variable or raise an exception."""
    value = os.getenv(var_name)
    if value is None:
        raise ValueError(f"{var_name} environment variable is not set")
    return value

# Configuration
class Settings:
    POSTGRES_URI = get_env_variable("POSTGRES_URI")
    MONGODB_URI = get_env_variable("MONGODB_URI")
    MINIO_ENDPOINT = get_env_variable("MINIO_ENDPOINT")
    MINIO_ROOT_USER = get_env_variable("MINIO_ROOT_USER")
    MINIO_ROOT_PASSWORD = get_env_variable("MINIO_ROOT_PASSWORD")
    MINIO_BUCKET_NAME = "task-attachments"

@lru_cache
def get_settings() -> Settings:
    return Settings()

settings = get_settings()

# FastAPI app initialization
app = FastAPI(title="Task Management API")

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Database setup
def setup_database(retries: int = 5, delay: int = 5):
    """Setup database connection with retry logic."""
    last_exception = None
    
    for attempt in range(retries):
        try:
            engine = create_engine(
                settings.POSTGRES_URI,
                pool_pre_ping=True,
                pool_size=5,
                max_overflow=10
            )
            engine.connect()
            logger.info("Successfully connected to PostgreSQL")
            return engine
        except Exception as e:
            last_exception = e
            if attempt < retries - 1:
                logger.error(f"Database connection attempt {attempt + 1} failed: {e}")
                logger.info(f"Retrying in {delay} seconds...")
                time.sleep(delay)
            else:
                logger.error("Failed to connect to database after all retries")
                raise last_exception

# Initialize database
engine = setup_database()
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# MongoDB setup
def setup_mongodb(retries: int = 5, delay: int = 5):
    """Setup MongoDB connection with retry logic."""
    for attempt in range(retries):
        try:
            client = AsyncIOMotorClient(settings.MONGODB_URI)
            # Test the connection
            client.admin.command('ping')
            logger.info("Successfully connected to MongoDB")
            return client
        except Exception as e:
            if attempt < retries - 1:
                logger.error(f"MongoDB connection attempt {attempt + 1} failed: {e}")
                logger.info(f"Retrying in {delay} seconds...")
                time.sleep(delay)
            else:
                logger.error("Failed to connect to MongoDB after all retries")
                raise

# Update the MongoDB initialization
try:
    mongo_client = setup_mongodb()
    mongo_db = mongo_client.taskdb
    task_comments = mongo_db.comments
except Exception as e:
    logger.error(f"Failed to initialize MongoDB: {e}")
    raise

# MinIO setup
minio_client = Minio(
    settings.MINIO_ENDPOINT,
    access_key=settings.MINIO_ROOT_USER,
    secret_key=settings.MINIO_ROOT_PASSWORD,
    secure=False
)

# Database Models
class Task(Base):
    __tablename__ = "tasks"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, nullable=False)
    description = Column(String)
    created_at = Column(DateTime, default=datetime.utcnow)

# Create tables
Base.metadata.create_all(bind=engine)

# Pydantic Models
class TaskBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    title: str
    description: Optional[str] = None

class TaskCreate(TaskBase):
    pass

class TaskResponse(TaskBase):
    id: int
    created_at: datetime

class CommentCreate(BaseModel):
    task_id: int
    content: str

# Dependencies
@contextmanager
def get_db():
    """Database session context manager."""
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Initialize MinIO bucket
@app.on_event("startup")
async def startup_event():
    """Initialize services on startup."""
    try:
        if not minio_client.bucket_exists(settings.MINIO_BUCKET_NAME):
            minio_client.make_bucket(settings.MINIO_BUCKET_NAME)
            logger.info(f"Created MinIO bucket: {settings.MINIO_BUCKET_NAME}")
    except Exception as e:
        logger.error(f"Failed to initialize MinIO bucket: {e}")
        raise

# Routes
@app.post("/tasks/", response_model=TaskResponse)
def create_task(task: TaskCreate):
    """Create a new task."""
    logger.info(f"Creating task: {task.model_dump()}")
    with get_db() as db:
        try:
            db_task = Task(**task.model_dump())
            db.add(db_task)
            db.commit()
            db.refresh(db_task)
            logger.info(f"Created task with ID: {db_task.id}")
            return db_task
        except Exception as e:
            logger.error(f"Error creating task: {e}")
            raise HTTPException(status_code=500, detail=str(e))

@app.get("/tasks/", response_model=List[TaskResponse])
def get_tasks():
    """Get all tasks."""
    with get_db() as db:
        try:
            tasks = db.query(Task).all()
            return tasks
        except Exception as e:
            logger.error(f"Error fetching tasks: {e}")
            raise HTTPException(status_code=500, detail=str(e))

@app.post("/tasks/{task_id}/comments/")
async def add_comment(task_id: int, comment: CommentCreate):
    """Add a comment to a task."""
    try:
        result = await task_comments.insert_one({
            "task_id": task_id,
            "content": comment.content,
            "created_at": datetime.utcnow()
        })
        return {
            "message": "Comment added successfully",
            "comment_id": str(result.inserted_id)
        }
    except Exception as e:
        logger.error(f"Error adding comment: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/tasks/{task_id}/attachments/")
async def upload_attachment(task_id: int, file: UploadFile = File(...)):
    """Upload an attachment for a task."""
    try:
        file_data = await file.read()
        object_name = f"{task_id}/{file.filename}"
        minio_client.put_object(
            settings.MINIO_BUCKET_NAME,
            object_name,
            file_data,
            length=len(file_data)
        )
        return {
            "message": "File uploaded successfully",
            "object_name": object_name
        }
    except Exception as e:
        logger.error(f"Error uploading file: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/health")
async def health_check():
    """Comprehensive health check endpoint."""
    health_status = {
        "status": "checking",
        "postgres": False,
        "mongodb": False,
        "minio": False,
        "checks": {}
    }
    
    # Check PostgreSQL
    try:
        with get_db() as db:
            db.execute(text("SELECT 1"))
            health_status["postgres"] = True
    except Exception as e:
        health_status["checks"]["postgres_error"] = str(e)
        logger.error(f"PostgreSQL health check failed: {e}")
    
    # Check MongoDB
    try:
        await mongo_client.admin.command('ping')
        health_status["mongodb"] = True
    except Exception as e:
        health_status["checks"]["mongodb_error"] = str(e)
        logger.error(f"MongoDB health check failed: {e}")
    
    # Check MinIO
    try:
        minio_client.list_buckets()
        health_status["minio"] = True
    except Exception as e:
        health_status["checks"]["minio_error"] = str(e)
        logger.error(f"MinIO health check failed: {e}")
    
    # Determine overall health
    health_status["status"] = "healthy" if all([
        health_status["postgres"],
        health_status["mongodb"],
        health_status["minio"]
    ]) else "unhealthy"
    
    return health_status

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="info")