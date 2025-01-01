FROM python:3.10-slim-bullseye

WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    build-essential \
    cmake \
    python3-dev \
    gcc \
    g++ \
    libpthread-stubs0-dev \
    # Dependencies for OpenCV and other scientific packages
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    # Clean up
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Set environment variables for CPU-only build
ENV CMAKE_ARGS="-DLLAMA_METAL=OFF -DCMAKE_C_FLAGS=-pthread -DCMAKE_CXX_FLAGS=-pthread"
ENV FORCE_CMAKE=1
ENV LLAMA_METAL=0

# Upgrade pip and install build tools
RUN pip3 install --upgrade pip setuptools wheel

# Copy requirements file
COPY requirements.txt .

# Install Python packages in groups to better manage dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Install Jupyter kernel
RUN python3 -m ipykernel install --name ds --display-name "Data Science (Python 3)"

# Set up Jupyter configuration
RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension
COPY jupyter_config.json /root/.jupyter/jupyter_lab_config.json

EXPOSE 8888

# Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]