FROM ruby:2.7.6

RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client --fix-missing

WORKDIR /delivery_service

COPY Gemfile /delivery_service/Gemfile

COPY Gemfile.lock /delivery_service/Gemfile.lock

RUN gem install bundler:2.4.22

RUN bundle install

COPY . /delivery_service

# CMD ["rails", "server"]
CMD ["rails", "server", "-b", "0.0.0.0"]


