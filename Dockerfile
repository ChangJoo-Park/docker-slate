FROM ubuntu:latest
LABEL maintainer="pcjpcj2@gmail.com"

RUN apt-get update
RUN apt-get install -yq ruby ruby-dev build-essential ruby-bundler patch zlib1g-dev liblzma-dev nodejs
RUN gem install --no-ri --no-rdoc bundler
ADD slate/Gemfile /app/Gemfile
ADD slate/Gemfile.lock /app/Gemfile.lock
RUN cd /app; bundle install
ADD slate/ /app
EXPOSE 4567
WORKDIR /app

ONBUILD RUN rm -fr /app/source
ONBUILD ADD . /app/source
