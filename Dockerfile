FROM ruby:2.3.0

RUN apt-get update -qq
RUN apt-get install -y -qq build-essential
RUN apt-get install -y -qq nodejs
RUN apt-get install -y -qq imagemagick
RUN apt-get install -y -qq libpq-dev
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

ENV APP_HOME /app
ENV BUNDLE_PATH /bundle
ENV BUNDLE_JOBS 5

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

COPY . /app

RUN gem install bundler --no-ri --no-rdoc

CMD ["/bin/bash"]