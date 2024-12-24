# Fraud Detection Machine Learning Project

## Project Overview
This project provides a comprehensive machine learning environment for fraud detection using Docker, Jupyter Lab, and best practices in data science and machine learning.

## Project Structure
- `src/`: Source code modules
  - `data/`: Data loading and cleaning utilities
  - `models/`: Model definition and training
- `notebooks/`: Jupyter notebooks for data preparation, training, and prediction
- `configs/`: Configuration files
- `tests/`: Unit tests for project components
- `data/`: Processed data storage
- `models/`: Trained model and preprocessor artifacts

## Prerequisites
- Docker
- Docker Compose
- Poetry (optional, but recommended)

## Setup and Running

### Using the Start Script
```bash
# Make the start script executable
chmod +x start.sh

# Build the Docker image
./start.sh build

# Start the Docker containers
./start.sh up

# Start Jupyter Lab
./start.sh jupyter
```

### Manual Docker Commands
```bash
# Build the image
docker-compose build

# Start containers
docker-compose up -d

# Access Jupyter Lab
docker-compose exec ml-app poetry run jupyter lab
```

## Workflow
1. Data Preparation (`notebooks/01_data_preparation.ipynb`)
   - Load and clean data
   - Preprocess features
   - Split into train/test sets

2. Model Training (`notebooks/02_model_training.ipynb`)
   - Train machine learning model
   - Evaluate model performance
   - Save trained model

3. Prediction (`notebooks/03_prediction.ipynb`)
   - Load trained model
   - Make predictions
   - Analyze results

## Development Tools
- Code Formatting: `poetry run black .`
- Linting: `poetry run flake8`
- Type Checking: `poetry run mypy`
- Testing: `poetry run pytest`

## Customization
- Update `configs/model_config.yaml` to modify model hyperparameters
- Replace synthetic data with your own fraud detection dataset
- Experiment with different preprocessing and model architectures

## Note
This project uses a custom IPython kernel named 'fraud' within Jupyter Lab.