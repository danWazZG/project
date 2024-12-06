# Base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
# RUN pip install -r requirements.txt

# Run the application
CMD ["python", "app.py"]
