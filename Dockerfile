FROM debian:buster

COPY . /

RUN chmod +x ttyd && chmod +x run.sh
    apt install iperf -y && apt install htop -y

CMD ./run.sh
