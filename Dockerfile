FROM debian:buster

COPY . /

RUN chmod +x ttyd && chmod +x run.sh

CMD ./run.sh
