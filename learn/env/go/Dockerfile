# Dockerfile
FROM golang:1.21-alpine

WORKDIR /app

COPY go.mod ./
COPY . .

RUN go mod download

# Debug: List all files in the container
RUN ls -la
RUN ls -la templates/
RUN ls -la static/

EXPOSE 8080

CMD ["go", "run", "main.go"]
