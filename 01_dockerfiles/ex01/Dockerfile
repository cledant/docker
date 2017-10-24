FROM debian:stretch

COPY scripts /opt/scripts

RUN apt-get update && apt-get upgrade \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y wget bzip2 \
	&& useradd -M -s /bin/false --uid 1000 ts3 \
	&& cd /opt \
	&& wget http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 \
	&& tar -jxvf /opt/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 \
	&& rm -rf teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 \
	&& chown -R ts3:ts3 /opt/teamspeak3-server_linux_amd64 \
	&& chown -R ts3:ts3 /opt/scripts \
	&& chmod -R 744 /opt/scripts

EXPOSE 9987/udp 10011 30033

USER ts3

VOLUME /opt/teamspeak3-server_linux_amd64

WORKDIR /opt/teamspeak3-server_linux_amd64

ENTRYPOINT /opt/scripts/run_server.sh
