# Use Python base image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    scipy \
    pystan \
    arviz \
    jupyter

# Create and set working directory
WORKDIR /stan_project

# Create a simple test script to verify Stan installation
COPY <<EOF /stan_project/test_stan.py
import stan
import numpy as np

# Define a simple Stan model
model_code = """
data {
    int<lower=0> N;
    array[N] real y;
}
parameters {
    real mu;
    real<lower=0> sigma;
}
model {
    mu ~ normal(0, 10);
    sigma ~ exponential(1);
    y ~ normal(mu, sigma);
}
"""

# Compile and test the model
def test_stan():
    # Generate some sample data
    N = 100
    y = np.random.normal(2, 1, N)
    
    # Prepare data for Stan
    data = {'N': N, 'y': y}
    
    # Compile and fit the model
    posterior = stan.build(model_code, data=data)
    fit = posterior.sample(num_chains=4, num_samples=1000)
    print("Stan installation successful!")
    
if __name__ == "__main__":
    test_stan()
EOF

# Start Jupyter by default
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]