FROM alpine:3.5

ADD ttyd /ttyd

RUN chmod +x ttyd

CMD /app/ttyd -p 80 bash
