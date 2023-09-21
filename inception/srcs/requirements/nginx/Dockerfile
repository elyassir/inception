FROM alpine:3.14

EXPOSE 443

# RUN mkdir /run/nginx

# this is not necessary because nginx will create it 
# in alpine 3.14 

RUN apk update && apk add nginx openssl

RUN mkdir /var/www/html/
COPY index.html /var/www/html/


RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/myhostname.key -out /etc/nginx/ssl/myhostname.crt -subj "/C=MO/L=/O=/OU=/CN="
# i think there is no -nodes
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]






# Read about how daemons work and whether it’s
# a good idea to use them or not

# mkdir : create a directory
# /run/nginx : this is the directory where nginx.pid will be created

# Install nginx

# nginx SSL



# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#         -out /etc/nginx/ssl/example.crt \
#         -keyout /etc/nginx/ssl/example.key \
#         -subj "/"
# nginx config

# Start nginx



# hit ila kan daemon on nginx will run in the background and has no controlling terminal
# and image will exit

# nginx -g daemon off;
# -g : global configuration
# daemon off : nginx will not run as a daemon
# daemon on : nginx will run as a daemon
# daemon : is a process that runs in the background and has no controlling terminal
