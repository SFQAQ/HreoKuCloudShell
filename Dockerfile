FROM alpine:3.5

COPY . /app
RUN chmod +x /app/gotty

CMD /app/gotty -p $PORT -w
