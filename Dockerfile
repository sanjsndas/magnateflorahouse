# Use the stable nginx alpine image for a tiny footprint (~5MB)
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your static files (HTML, CSS, JS) to the nginx directory
# Assumes your files are in a folder named 'public' or the root of your repo
COPY . /usr/share/nginx/html

# Northflank needs to route traffic to the container
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
