FROM alpine:3.13
COPY index.html /var/www/html/

RUN mkdir /run/nginx
# mkdir : create a directory
# /run/nginx : this is the directory where nginx.pid will be created

# Install nginx
RUN apk update && apk add nginx openssl

# nginx SSL
# RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#         -out /etc/nginx/ssl/key.pem \
#         -keyout /etc/nginx/ssl/key.key \
#         -subj "/"
# nginx config

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/html/
EXPOSE 80
# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# hit ila kan daemon on nginx will run in the background and has no controlling terminal
# and image will exit

# nginx -g daemon off;
# -g : global configuration
# daemon off : nginx will not run as a daemon
# daemon on : nginx will run as a daemon
# daemon : is a process that runs in the background and has no controlling terminal
