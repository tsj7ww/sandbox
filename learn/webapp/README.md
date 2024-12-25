project-root/
├── docker/
│   ├── frontend/
│   │   ├── angular/
│   │   │   ├── Dockerfile
│   │   │   └── nginx.conf
│   │   ├── nextjs/
│   │   │   └── Dockerfile
│   │   └── react/
│   │       └── Dockerfile
│   ├── backend/
│   │   ├── fastapi/
│   │   │   └── Dockerfile
│   │   ├── flask/
│   │   │   └── Dockerfile
│   │   ├── spring-boot/
│   │   │   └── Dockerfile
│   │   ├── express/
│   │   │   └── Dockerfile
│   │   └── gin/
│   │       └── Dockerfile
│   └── databases/
│       ├── minio/
│       │   └── Dockerfile
│       ├── mongodb/
│       │   └── Dockerfile
│       ├── mysql/
│       │   └── Dockerfile
│       ├── postgres/
│       │   └── Dockerfile
│       ├── redis/
│       │   └── Dockerfile
│       └── timescaledb/
│           └── Dockerfile
├── src/
│   ├── frontend/
│   │   ├── angular-app/
│   │   ├── nextjs-app/
│   │   └── react-app/
│   └── backend/
│       ├── fastapi-app/
│       ├── flask-app/
│       ├── spring-app/
│       ├── express-app/
│       └── gin-app/
├── jenkins/
│   ├── Jenkinsfile
│   └── scripts/
├── kubernetes/
│   ├── frontend/
│   ├── backend/
│   └── databases/
├── tests/
│   ├── integration/
│   └── e2e/
├── docker-compose.yaml
├── docker-compose.dev.yaml
├── docker-compose.test.yaml
└── README.md