FROM alpine:3.5

RUN wget https://cdn.jsdelivr.net/gh/SFQAQ/HreoKuSSHhost/ttyd.x86_64 -P /root
RUN chmod +x /root/ttyd.x86_64


CMD ttyd.x86_64 -p 80 bash
