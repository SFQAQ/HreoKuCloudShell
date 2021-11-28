FROM alpine:3.5

COPY . /

RUN chmod +x ttyd && chmod +x run.sh

CMD ./run.sh
