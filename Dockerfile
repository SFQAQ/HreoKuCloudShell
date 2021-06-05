FROM alpine:3.5

RUN wget https://cdn.jsdelivr.net/gh/SFQAQ/HreoKuSSHhost/ttyd
RUN chmod +x ttyd.x86_64


CMD ttyd -p 80 bash
