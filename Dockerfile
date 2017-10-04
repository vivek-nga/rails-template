FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP_PATH /var/www/html
RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY config/puma.rb config/puma.rb

COPY . .

EXPOSE 3000

CMD bundle exec puma -C config/puma.rb


