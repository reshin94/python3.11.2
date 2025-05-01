# Base UBI 9 image
FROM registry.access.redhat.com/ubi9/ubi

# Install build dependencies for Python
RUN dnf update -y && \
    dnf install -y \
    gcc \
    make \
    wget \
    zlib-devel \
    bzip2 \
    bzip2-devel \
    libreadline \
    libreadline-devel \
    libffi-devel \
    openssl-devel \
    xz-devel \
    sqlite-devel \
    tar \
    git \
    which && \
    dnf clean all
# Install Python 3.11.2
ENV PYTHON_VERSION=3.11.2

RUN cd /usr/src && \
    wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar xzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall

# Create symlinks
RUN ln -s /usr/local/bin/python3.11 /usr/bin/python3 && \
    ln -s /usr/local/bin/pip3.11 /usr/bin/pip3



RUN pip3 install --no-cache-dir -r requirements.txt


# Set the default command
CMD [ "python3" ]
