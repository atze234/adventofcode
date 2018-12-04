FROM golang:latest as builder
# Install dependencies
RUN apt-get update && \
    apt-get -y install \
      bash-completion \ 
      ca-certificates \
      curl \
      dnsutils \
      gettext \
      groff \
      jq \
      libconfig-inifiles-perl \
      mariadb-server \
      mc \
      mysql-client \
      netcat \
      openssl \
      python-pip \
      unzip \
      vim \
      wget \
      ssh \
      gettext\
      git
RUN mkdir -p /go/src/adventofcode
VOLUME /go/src/adventofcode
WORKDIR /go/src/adventofcode
COPY ./scripts/entrypoint.sh /entrypoint.sh

# Aliases
RUN echo "alias l=\"ls -lah --color\"" >> ~/.profile && \
    echo "export PATH=\"/usr/local/go/bin:$PATH\";"  >> ~/.profile
#RUN go get ./...
#ARG KUBETOKEND_HOST=https://kube-signin.example.com
#RUN go build -x
ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT ["sh"]
#FROM golang:latest 
#RUN mkdir /app 
#ADD . /app/
#WORKDIR /app 
#RUN go build -o main . 
#CMD ["/app/main"]
