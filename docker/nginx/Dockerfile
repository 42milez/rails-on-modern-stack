FROM nginx:1.17.1

ENV DEBIAN_FRONTEND noninteractive

ADD ./docker/nginx/conf/nginx.conf /etc/nginx/nginx.conf
ADD ./docker/nginx/conf/app.conf /etc/nginx/conf.d/app.conf
