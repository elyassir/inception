FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private.key -out /etc/ssl/certificate.crt -subj "/C=MA/ST=Benguerir/L=Benguerir/O=1337/CN=yel-mass.42.fr";

# Country, State, City, Organization, Common Name (hostname)

COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]