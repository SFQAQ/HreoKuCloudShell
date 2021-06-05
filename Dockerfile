FROM alpine:3.5

ADD ttyd /ttyd

RUN chmod +x /app/ttyd

CMD /app/ttyd -p 80 bash
