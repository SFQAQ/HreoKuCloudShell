FROM niruix/sshwifty:latest AS builder

FROM alpine:latest

ENV SSHWIFTY_HOSTNAME= \
    SSHWIFTY_SHAREDKEY= \
    SSHWIFTY_DIALTIMEOUT=10 \
    SSHWIFTY_SOCKS5= \
    SSHWIFTY_SOCKS5_USER= \
    SSHWIFTY_SOCKS5_PASSWORD= \
    SSHWIFTY_LISTENINTERFACE=0.0.0.0 \
    SSHWIFTY_LISTENPORT=8182 \
    SSHWIFTY_INITIALTIMEOUT=0 \
    SSHWIFTY_READTIMEOUT=0 \
    SSHWIFTY_WRITETIMEOUT=0 \
    SSHWIFTY_HEARTBEATTIMEOUT=0 \
    SSHWIFTY_READDELAY=0 \
    SSHWIFTY_WRITEELAY=0 \
    SSHWIFTY_TLSCERTIFICATEFILE= \
    SSHWIFTY_TLSCERTIFICATEKEYFILE= \
    SSHWIFTY_DOCKER_TLSCERT= \
    SSHWIFTY_DOCKER_TLSCERTKEY= \
    SSHWIFTY_PRESETS= \
    SSHWIFTY_ONLYALLOWPRESETREMOTES=

COPY --from=builder /sshwifty /sshwifty
COPY --from=builder /sshwifty-src /sshwifty-src

RUN set -ex && \
    adduser -D sshwifty && \
    chmod +x /sshwifty && \
    echo '#!/bin/sh' > /sshwifty.sh && \
    echo '([ -z "$SSHWIFTY_DOCKER_TLSCERT" ] || echo "$SSHWIFTY_DOCKER_TLSCERT" > /tmp/cert); ([ -z "$SSHWIFTY_DOCKER_TLSCERTKEY" ] || echo "$SSHWIFTY_DOCKER_TLSCERTKEY" > /tmp/certkey); if [ -f "/tmp/cert" ] && [ -f "/tmp/certkey" ]; then SSHWIFTY_TLSCERTIFICATEFILE=/tmp/cert SSHWIFTY_TLSCERTIFICATEKEYFILE=/tmp/certkey /sshwifty; else /sshwifty; fi;' >> /sshwifty.sh && \
    chmod +x /sshwifty.sh

USER sshwifty
EXPOSE 8182
CMD [ "/sshwifty.sh" ]