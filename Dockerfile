FROM linuxserver/baseimage
MAINTAINER Tim Katje <tmkatje@gmail.com>

ENV APTLIST="python"

RUN apt-get update && \
apt-get install $APTLIST -qy && \
ln -fs /app/unrar /usr/bin/unrar && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh
 
#Mappings
#VOLUME /config:/DockerStorage/nzbget /downloads:/transfer/nzbget
VOLUME /config:/DockerStorage/nzbget \
/incomplete:/transfer/nzbget/incomplete \
/temporary:/transfer/nzbget/tmp
EXPOSE 6789:6789
