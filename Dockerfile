FROM ruby:2.7
MAINTAINER dani.leguizamon@gmail.com

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# rails
RUN gem install rails bundler
COPY boatyard_api/Gemfile Gemfile
COPY boatyard_api/Rakefile Rakefile
COPY boatyard_api/ /opt/app/boatyard_api

RUN bundle install
RUN chown -R user:user /opt/app
WORKDIR /opt/app/boatyard_api

USER $USER_ID
VOLUME ["$INSTALL_PATH/public"]
