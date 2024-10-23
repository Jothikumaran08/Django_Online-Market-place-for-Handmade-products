# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file first, so Docker caches this step when requirements don't change
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . /app

# Expose port 8000 for Django
EXPOSE 8000

# Default command: Run Gunicorn for production
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "ecommerce.wsgi:application"]


# Development command: Uncomment this line for local development with Django's runserver
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

