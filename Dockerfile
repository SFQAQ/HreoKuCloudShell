FROM alpine:3.5

COPY . /
RUN chmod +x gotty

CMD gotty -w -p $RROT bash
