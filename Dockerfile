#FROM debian:latest
FROM bash
WORKDIR /usr/flask-tor/

RUN apk  update -q &&\
    apk add tor -q &&\
    apk add nano -q &&\
    apk add psmisc -q &&\
    apk add python3 -q &&\
    apk add py3-pip -q &&\
    apk add openrc -q &&\
    apk add sudo &&\
    pip3 install gunicorn 
RUN apk add --update util-linux

RUN cp ./etc/tor/torrc /etc/tor/torrc &&\ 
    chmod o=r /etc/tor/torrc &&\
    printf "HiddenServiceDir /var/lib/tor/hidden_service/\nHiddenServicePort 80 127.0.0.1:8080" >> /etc/tor/torrc  &&\
    openrc boot


RUN adduser -D flaskuser && echo 'flaskuser:&flaskuser&' | chpasswd &&\ 
    echo 'tor:&tor&' | chpasswd &&\
    echo 'root:&root&' | chpasswd &&\
    addgroup tor &&\
    addgroup flaskuser &&\
    addgroup tor tor; exit 0  &&\
    addgroup flaskuser flaskuser; exit 0

RUN chmod u+s,g+s /bin/su

    

USER tor
RUN mkdir -p /var/lib/tor/ 


USER flaskuser
COPY --chown=flaskuser:flaskuser ./app/ ./app/
RUN pip3 install --quiet -r ./app/requirements.txt 

RUN chmod -R g=,o= ./app 






















