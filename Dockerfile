FROM ubuntu:18.04

COPY . /
RUN chmod +x gotty

CMD ./gotty
