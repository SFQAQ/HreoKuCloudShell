FROM alpine:3.5

COPY . /app
RUN chmod +x /app/ttyd

CMD /app/ttyd -p $PORT bash
