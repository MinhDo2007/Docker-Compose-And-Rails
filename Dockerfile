# build 1 image từ image ruby 2.3 có sẵn trên Docker hub
FROM ruby:2.3
# cài đặt các package cần thiết
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# tạo thư mục app trên container
RUN mkdir /Compose-And-Rails
# sử dụng và làm việc trong Compose-And-Rails
WORKDIR /Compose-And-Rails
#set timezone trên container và cài đặt TZ
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Copy các file Gemfile, Gemfile.lock vào trong container Compose-And-Rails
COPY Gemfile /Compose-And-Rails/Gemfile
COPY Gemfile.lock /Compose-And-Rails/Gemfile.lock
#bundle install
RUN bundle install
#copy toàn thư mục vào trong container Compose-And-Rails
COPY . /myapp
