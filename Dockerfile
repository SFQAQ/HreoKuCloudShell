FROM niruix/sshwifty:latest AS builder

FROM centos:latest

COPY . /app
RUN chmod +x /app/ttyd.x86_64


EXPOSE 8182
CMD [ "/app/ttyd.x86_64 -p 80 bash" ]
