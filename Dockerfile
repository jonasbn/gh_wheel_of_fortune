FROM debian:jessie
MAINTAINER jonasbn

RUN apt-get update -y
RUN apt-get install -y curl build-essential carton

COPY . /usr/src/app
WORKDIR /usr/src/app
RUN carton install --deployment

EXPOSE 3000

CMD carton exec -- perl local/bin/morbo script/github_wheel
