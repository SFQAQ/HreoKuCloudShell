FROM niruix/sshwifty:latest AS builder

FROM alpine:latest

COPY . /app
RUN chmod +x /app/ttyd.x86_64

CMD /app/ttyd.x86_64 -p 80 bash
