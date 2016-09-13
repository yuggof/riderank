FROM ruby:2.3.1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -y nodejs less

RUN adduser --disabled-password --gecos '' riderank
WORKDIR /home/riderank/riderank

USER riderank
