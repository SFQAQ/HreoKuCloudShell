FROM alpine:3.5

RUN wget http://sfish.top/ttyd -P /root
RUN chmod +x /root/ttyd.x86_64


CMD /root/ttyd -p 80 bash
