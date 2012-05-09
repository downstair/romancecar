# -*- coding: utf-8 -*-

require 'mongoid'
# require 'sinatra/reloader' if development?
require 'open-uri'
require 'haml'
require 'sass'
require 'coffee-script'
require 'yaml'
# require 'httpclient'
require 'json/pure'
require 'uri'
require 'rack/csrf'
require 'active_support/all'

require './config/mongoid'

require 'carrierwave'
require 'carrierwave/mongoid'
require './config/carrierwave'

Dir.entries('./uploaders').each do |entry|
  next if entry !~ /.*\.rb/
  require "./uploaders/#{entry}"
end

Dir.entries('./models').each do |entry|
  next if entry !~ /.*\.rb/
  require "./models/#{entry}"
end
