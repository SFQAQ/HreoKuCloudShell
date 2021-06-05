FROM niruix/sshwifty:latest AS builder

FROM alpine:latest

COPY . /app
    chmod +x /app/ttyd.x86_64
    chmod +x /app/run.sh

CMD /app/run.sh
