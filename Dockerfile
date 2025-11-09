# Use official NGINX image for static site
FROM nginx:alpine
COPY . /usr/share/nginx/html
