FROM ruby:2.7.7-alpine

ENV LANG="C.UTF-8" \
    PACKAGES="curl-dev build-base alpine-sdk tzdata sqlite-dev less ruby-dev nodejs"

RUN apk update && \
    apk add --no-cache --update $PACKAGES

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
