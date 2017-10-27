FROM 		debian:latest

RUN 		apt-get update && apt-get upgrade -y \
			&& apt-get install -y git \
			&& apt-get install -y wget \
			&& apt-get install -y gcc \
			&& adduser --disabled-login --gecos 'Gogs' git

USER		git
RUN			cd ~ \
			&& mkdir local \
			&& cd local \
			&& wget https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz \
			&& tar -C /home/git/local -xzf go1.9.1.linux-amd64.tar.gz \
			&& rm -rf go1.9.1.linux-amd64.tar.gz \

USER		git
ENV 		HOME /home/git
ENV 		GOROOT $HOME/local/go
ENV 		GOPATH $HOME/go
ENV 		PATH $PATH:$GOROOT/bin:$GOPATH/bin
RUN			cd ~ \
			&& mkdir -p $GOPATH/src/github.com/gogits \
			&& cd $GOPATH/src/github.com/gogits \
			&& git clone --depth=1 -b develop https://github.com/gogits/gogs \
			&& go get -u -tags "sqlite" github.com/gogits/gogs \
			&& cd gogs \
			&& go build -tags "sqlite"

USER		root
RUN			mkdir /data \
			&& chown git:git /data

USER		git
WORKDIR 	/
ENV			USER git
ENV			USERNAME git
ENTRYPOINT  ~/go/src/github.com/gogits/gogs/gogs web

EXPOSE 22 3000
