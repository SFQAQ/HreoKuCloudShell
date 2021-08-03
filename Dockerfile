FROM debian:buster

COPY . /
RUN apt-get install -y wget htop curl unzip
RUN chmod +x ttyd && chmod +x run.sh

CMD ./run.sh
