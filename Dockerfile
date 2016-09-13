FROM ruby:2.3.1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -y nodejs less

RUN adduser --disabled-password --gecos '' riderank
WORKDIR /home/riderank/riderank

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle

COPY . .
RUN chown -R riderank:riderank .

USER riderank

CMD ["rails", "s", "-b", "0.0.0.0"]
