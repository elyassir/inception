FROM debian:buster

EXPOSE 443

# RUN mkdir /run/nginx

# this is not necessary because nginx will create it 
# in alpine 3.14 

RUN apt-get update -y && apt-get install nginx openssl -y

COPY index.html /var/www/html/


RUN mkdir /etc/nginx/ssl

# RUN openssl req -x509 -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/myhostname.key -out /etc/nginx/ssl/myhostname.crt -subj "/C=MO/L=/O=/OU=/CN="
# # i think there is no -nodes
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl genpkey -algorithm RSA -out /etc/nginx/ssl/private.key
RUN openssl req -new -key /etc/nginx/ssl/private.key -out /etc/nginx/ssl/csr.pem -subj "/C=MA/ST=MA/L=Agadir/O=1337/CN=www.example.com"
RUN openssl x509 -req -days 365 -in /etc/nginx/ssl/csr.pem -signkey /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt 

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
