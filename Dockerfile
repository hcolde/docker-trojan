FROM ubuntu:18.04

EXPOSE 443

ENV DOMAIN=example.com

ENV PASSWORD=123456

WORKDIR /work

RUN ["apt-get", "update", "-y"]

RUN ["apt-get", "install", "-y", "openssl", "libssl-dev", "nginx"]

COPY ./install.sh /work/

COPY ./trojan.tar.gz /work/

ENTRYPOINT ["/work/install.sh"]
