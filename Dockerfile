FROM niruix/sshwifty:latest AS builder

FROM centos:latest

COPY . /app
RUN wegt https://cdn.jsdelivr.net/gh/SFQAQ/HreoKuSSHhost/ttyd.x86_64
RUN wget https://cdn.jsdelivr.net/gh/SFQAQ/HreoKuSSHhost/run.sh
RUN chmod +x ttyd.x86_64
RUN chmod +x run.sh


EXPOSE 8182
CMD [ "./run.sh" ]
