# -*- coding: utf-8 -*-

# setting load paths
root_path = File.dirname(__FILE__).sub(%r(/config$), '')
$LOAD_PATH.unshift(root_path)
$LOAD_PATH.unshift(root_path + '/lib')

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

# database: mongoid
require 'mongoid'
require 'config/mongoid'
require 'carrierwave'
require 'carrierwave/mongoid'
require 'config/carrierwave'

# require application units
%w(uploaders models helpers).each do |directory|
  Dir.entries("./#{directory}").each do |entry|
    next if entry !~ /.*\.rb/
    require "#{directory}/#{entry}"
  end
end
