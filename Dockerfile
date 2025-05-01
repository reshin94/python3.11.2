# Use Red Hat Universal Base Image 9 minimal
FROM registry.access.redhat.com/ubi9/python-311

# Set the working directory inside the container


# Copy requirements.txt file into the container
COPY requirements.txt .

# Install required Python packages
RUN pip install --upgrade pip && \
    pip install -r requirements.txt




# Set default command
CMD ["python"]
