FROM ubuntu
MAINTAINER brekan.net

#Ubuntu requirements
RUN apt-get -y update && \ 
    DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install  ca-certificates lib32gcc1 net-tools lib32stdc++6 lib32z1 lib32z1-dev curl 

ENV USER steam

RUN useradd $USER
ENV HOME /home/$USER
RUN mkdir $HOME
RUN chown $USER:$USER $HOME

ENV SERVER $HOME/hlserver
RUN mkdir $SERVER

ADD ./csgo_ds.txt $SERVER/csgo_ds.txt
ADD ./update.sh $SERVER/update.sh
ADD ./start.sh $SERVER/start.sh

RUN chown -R $USER:$USER $SERVER


USER $USER

RUN curl http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -C $SERVER -xvz
RUN chmod +x $SERVER/update.sh

#Server config
EXPOSE 27015

RUN chmod +x $SERVER/start.sh

#Server Start
WORKDIR /home/$USER/hlserver
RUN $SERVER/update.sh
ENTRYPOINT ["./start.sh"]
CMD ["-console" "-usercon" "+game_type" "0" "+game_mode" "1" "+mapgroup" "mg_active" "+map" "de_cache"]
