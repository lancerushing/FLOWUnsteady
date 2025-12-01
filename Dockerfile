FROM julia:1.12.2-bookworm

# Install system dependencies required for FLOWUnsteady
# - CMake, GCC: For compiling ExaFMM and other native dependencies
# - OpenMPI, MPICH: For parallel computing support
# - Python 3.11: Compatible with AirfoilPrep (avoids Python 3.12+ imp module deprecation)
# - Python packages: matplotlib, scipy, mpmath for visualization and scientific computing

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3.11 \
        python3-pip \
        git \
        python3-matplotlib python3-mpmath python3-scipy && \
     rm -rf /var/lib/apt/lists/*

# Configure PyCall to use Python 3.11 (avoids AirfoilPrep compatibility issues)
#ENV PYTHON=/usr/bin/python3.11

# Set working directory to match project structure
WORKDIR /workspace/FLOWUnsteady

# Default command: interactive bash shell for development
CMD ["/bin/bash"]
