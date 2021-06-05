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

RUN export UNAME=$UNAME UID=1000 GID=1000 && \
    mkdir -p "/home/${UNAME}" && \
    echo "${UNAME}:x:${UID}:${GID}:${UNAME} User,,,:/home/${UNAME}:/bin/bash" >> /etc/passwd && \
    echo "${UNAME}:x:${UID}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
    gpasswd -a ${UNAME} audio
    chmod +x /sshwifty.sh

USER sshwifty
EXPOSE 8182
CMD [ "/sshwifty.sh" ]
