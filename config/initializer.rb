# -*- coding: utf-8 -*-

require 'mongoid'
require 'sinatra/reloader' if development?
require 'open-uri'
require 'haml'
require 'sass'
require 'yaml'
require 'httpclient'
require 'json/pure'
require 'uri'
require 'rack/csrf'
require 'active_support/all'

require './config/mongoid'

