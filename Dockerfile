#FROM nginx:latest
#COPY . /usr/share/nginx/html
# Use the official NGINX base image from Docker Hub
FROM nginx:latest

# Optional: Replace default NGINX configuration with your custom configuration
COPY . /usr/share/nginx/html

# Optional: Add any additional static files or assets required by your application
# COPY static_files /path/to/nginx/static_files

# Expose the port that NGINX will listen on
EXPOSE 8080

# Start NGINX in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]

