FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add build-base ruby ruby-dev ruby-bundler ruby-io-console libxslt-dev libxml2-dev libgcrypt && \
    rm -rf /var/cache/apk/*

RUN mkdir /src
WORKDIR /src
COPY . /src

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

CMD ["bundle", "exec", "bin/newrelic_aws"]
