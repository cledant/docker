FROM 		ruby:2.4.1

RUN 		apt-get update && apt-get install -y build-essential libpq-dev nodejs \
			&& mkdir /opt/app

WORKDIR		/opt/app

ONBUILD ADD			Gemfile /opt/app
ONBUILD ADD			Gemfile.lock /opt/app
ONBUILD RUN			gem install rails
ONBUILD RUN			bundle install
ONBUILD ADD 		. /opt/app
ONBUILD RUN			rails db:migrate

EXPOSE				3000
