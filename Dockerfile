FROM niruix/sshwifty:latest AS builder

FROM alpine:latest

COPY . /app
RUN chmod +x /app/ttyd.x86_64
RUN chmod +x /app/run.sh

EXPOSE 8182
CMD [ "./run.sh" ]
