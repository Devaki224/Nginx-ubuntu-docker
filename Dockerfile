# 1. Use Ubuntu as the base image
FROM ubuntu:20.04

# 2. Set environment variable to disable interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# 3. Update the package list and install NGINX
RUN apt-get update && apt-get install -y nginx && apt-get clean

# 4. Copy the custom HTML file to the default NGINX directory
COPY index.html /var/www/html/index.html

# 5. Expose port 80 so we can access the server
EXPOSE 80

# 6. Start NGINX in the foreground (important for Docker to keep the container alive)
CMD ["nginx", "-g", "daemon off;"]
