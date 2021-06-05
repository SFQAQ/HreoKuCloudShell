FROM alpine:3.5

COPY . /app
RUN chmod +x /app/ttyd


CMD /app/ttyd -p process.env.PORT || 80 bash
