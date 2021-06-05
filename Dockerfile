FROM niruix/sshwifty:latest AS builder

FROM alpine:latest

COPY . /app
RUN chmod +x /app/ttyd

CMD /app/ttyd -p 80 bash
