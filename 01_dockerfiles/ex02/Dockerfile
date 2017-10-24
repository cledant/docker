FROM 		ruby:latest

RUN 		apt-get update && apt-get install -y build-essential nodejs \
			&& mkdir -p /opt/app

WORKDIR		/opt/app

ONBUILD COPY		Gemfile Gemfile.lock ./ 

ONBUILD RUN			gem install bundler && bundle install --jobs 20 --retry 5

ONBUILD COPY 		. ./
