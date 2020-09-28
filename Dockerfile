# ----------------------------------
# Pterodactyl Panel Dockerfile
# Environment: Java 7 (glibc support)
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM        openjdk:7-jre-slim

LABEL       author="Seán K" maintainer="crash@forbid.fun"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
