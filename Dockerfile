FROM ubuntu:latest

WORKDIR /usr/flask-tor/

COPY ./main.py ./app/
COPY ./requirements.txt ./app/

RUN apt update -y &&\
    apt install tor -y &&\
    apt install nano -y &&\
    apt install psmisc -y &&\
    apt install -y python3 &&\
    apt install -y python3-pip &&\
    pip3 install --quiet -r ./app/requirements.txt &&\
    apt install systemctl -y &&\
    mkdir -p /var/lib/tor/hidden_service 
    

    

























