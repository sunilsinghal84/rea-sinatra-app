#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update -y
yum install -y git ruby-libs.x86_64 ruby-devel.x86_64 gcc
yum install -y amazon-linux-extras
amazon-linux-extras install ruby2.6 -y # 2.6 is required for bundler and io-console gems
runuser -l ec2-user -c 'cd /home/ec2-user; git clone https://github.com/rea-cruitment/simple-sinatra-app.git;gem install bundler; gem install io-console;cd simple-sinatra-app; bundle install; bundle exec rackup -o 0.0.0.0'