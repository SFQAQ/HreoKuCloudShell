FROM debian:buster

COPY . /
RUN chmod +x gotty
RUN chmod +x run.sh
RUN chmod +x /app/gcc

USER sfqaq

CMD ./run.sh
