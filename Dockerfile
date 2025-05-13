# Stage 1: Base image and environment setup
FROM ubuntu:20.04 as base

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install NGINX and other dependencies
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Stage 2: Development Environment
FROM base as development

# Set environment variable for development
ENV ENVIRONMENT=development

# Copy development-specific files
COPY index.html /var/www/html/index.html

# Expose the port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]

# Stage 3: Staging Environment
FROM base as staging

# Set environment variable for staging
ENV ENVIRONMENT=staging

# Copy staging-specific files
COPY index.html /var/www/html/index.html

# Expose the port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]

# Stage 4: Production Environment
FROM base as production

# Set environment variable for production
ENV ENVIRONMENT=production

# Copy production-specific files
COPY index.html /var/www/html/index.html

# Expose the port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]
