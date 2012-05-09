# -*- coding: utf-8 -*-

require 'spork'

Spork.prefork do
  require File.dirname(__FILE__) + '/../config/initializer'
  require 'pp'
  require 'rspec'
  require 'rack/test'
  require Dir.pwd + '/server'

  # database configuration for tests
  Mongoid.configure do |config|
    config.master = Mongo::Connection.new.db('romancecar-test')
  end

  CarrierWave.configure do |config|
    # reset database to romancecar-test
    config.grid_fs_connection = Mongoid.database
    # set root directory temporarily
    config.root = "#{Dir.pwd}/public/"
  end

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  RSpec.configure do |config|
    config.include Rack::Test::Methods

    config.before(:each) do
      Mongoid.database.collections.each do |collection|
        unless collection.name =~ /^system\./
          collection.remove
        end
      end
    end
  end

  def app
    Sinatra::Application
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end
