require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Added by tadatoshi based on "http://stackoverflow.com/questions/4943625/latest-rails-3-actionviewtemplateerror-couldnt-parse-yaml-at-line-105-colu"
require 'yaml'
YAML::ENGINE.yamler = 'syck'
