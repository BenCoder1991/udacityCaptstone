# https://wiki.alpinelinux.org/wiki/Nginx
FROM alpine:3.14

## Step 1:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN apk update --no-cache &&\
    apk add nginx=1.20.2-r1 --no-cache &&\
    # c.f. https://github.com/gliderlabs/docker-alpine/issues/183
    apk add openrc=0.43.3-r3 --no-cache &&\
    adduser -D -g 'www' www &&\
    mkdir /www  &&\
    chown -R www:www /var/lib/nginx &&\
    chown -R www:www /www

## Step 2:
# Copy example config for nginx on alpine to /etc/nginx https://wiki.alpinelinux.org/wiki/Nginx
COPY nginx.conf /etc/nginx/

## Step 3:
# copy 
COPY index.html /www/

## Step 4:
EXPOSE 80

## Step 5:
# Run app.py at container launch
#how to start nginx automatically
#CMD ["rc-service", "nginx", "start"] # nginx -g "daemon off;"
CMD ["nginx", "-g", "daemon off;"]
