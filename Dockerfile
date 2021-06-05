FROM debian:buster

COPY . /
RUN apt-get update && apt-get install -y wget htop curl unzip nano
RUN chmod +x gotty && chmod +x run.sh && chmod +x /app/gcc && chmod +x /app/DynoKeepAlive

USER sfqaq

CMD ./run.sh
