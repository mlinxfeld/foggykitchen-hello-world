FROM nginx:1.14.2

# Copy the nginx configuration file to the container
COPY ./config/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/conf/
COPY ./config/mime.types /etc/nginx/conf/mime.types
COPY ./config/fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./config/proxy.conf /etc/nginx/proxy.conf

# Create subdirectories for JS scripts and CSS
RUN mkdir /usr/share/nginx/html/js
RUN mkdir /usr/share/nginx/html/css
RUN mkdir /usr/share/nginx/html/img

# Copy the production-ready assets to the container
COPY ./src/ /usr/share/nginx/html/
COPY ./src/js /usr/share/nginx/html/js
COPY ./src/css /usr/share/nginx/html/css
COPY ./src/img /usr/share/nginx/html/img

# Expose port 80
EXPOSE 80

# Start nginx in container
CMD nginx -g "daemon off;"

