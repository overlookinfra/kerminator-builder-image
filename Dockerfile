from alpine:latest

run apk update &&  apk add git ruby npm nodejs nodejs-dev make bash python vim g++ curl unzip && rm -rf /var/lib/apk
run adduser -D -u 1001 -g "Kerminator Frogbot" -s /bin/bash kerminator
run mkdir -p /var/lib/kerminator && chown -R kerminator:kerminator /var/lib/kerminator
USER kerminator
WORKDIR /var/lib/kerminator
USER root
VOLUME /var/lib/kerminator
ADD Dockerfile /
EXPOSE 8000
CMD ["make", "slack"]
