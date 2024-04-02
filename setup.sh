#!/usr/bin/env bash

echo "Installing software needed to run Jekyll locally... "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

rvm install ruby-2.6.10
rvm use 2.6.10
gem install bundler 
gem install pkg-config
gem install nokogiri
# bundle config build.nokogiri --use-system-libraries
bundle install --path vendor/bundle
echo "Done."
