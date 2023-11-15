# Stage 1: Build Stage
FROM python:3.10-slim-buster AS builder

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Stage 2: Production Stage
FROM python:3.10-slim-buster

WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=builder /app /app

# Set the PYTHONPATH to include the current directory
ENV PYTHONPATH /app

# Print the contents of requirements.txt and then install dependencies
RUN cat /app/requirements.txt && \
    pip install --no-cache-dir -r /app/requirements.txt

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
