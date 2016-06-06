FROM ubuntu:latest

WORKDIR /home/
RUN su
RUN apt-get update -y && apt-get install -y default-jre \
default-jdk \
npm \
git
RUN npm install -g bower


COPY TeamCity*.tar.gz .
RUN mkdir .BuildServer
RUN mkdir .BuildServer/plugins
COPY jonnyzzz.node.zip .BuildServer/plugins/
COPY deploy-runner.zip .BuildServer/plugins/
COPY BuildServer/* .BuildServer/
COPY id_rsa /home/.ssh/
RUN tar xf TeamCity*.gz
EXPOSE 8111
