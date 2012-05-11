# -*- coding: utf-8 -*-

require 'sinatra'
require 'sinatra/namespace'
require './config/initializer'

# Routers and Controllers
get '/' do
  haml :index
end

get '/col/:id' do
  haml :index
end

# CMS
namespace '/cms' do
  get '/' do
    haml :'cms/index', layout: :'cms/layout'
  end

  get '/new' do
    haml :'cms/edit', layout: :'cms/layout'
  end

  post '/new' do
    # FIX IT
    redirect '/cms/edit/:id'
  end

  get '/edit/:id' do
    haml :'cms/edit', layout: :'cms/layout'
  end

  put '/edit/:id' do
    # FIX IT
    redirect '/cms/edit/:id'
  end

  get '/setting' do
    haml :'cms/setting', layout: :'cms/layout'
  end

  put '/setting' do
    redirect '/cms/setting'
  end

  get '/pictures' do
    @pictures = Picture.all.desc(:created_at)
    haml :'cms/pictures/index', layout: :'cms/layout'
  end

  post '/pictures' do
    @picture = Picture.new
    @picture.uploader = params[:file]
    @picture.save
    redirect '/cms/pictures'
  end

  get '/:id' do
    haml :'cms/show', layout: :'cms/layout'
  end
end

# load file from GridFS of MongoDB
get %r(/grid/(.*)) do |key|
  begin
    Mongo::GridFileSystem.new(Mongoid.database).open(key, 'r') do |file|
      [200, { 'Content-Type' => file.content_type }, [file.read]]
    end
  rescue
    404
  end
end

not_found do
  "Not Found"
end

error 403 do
  "Invalid Format"
end

get '/main.css' do
  sass :main
end

get '/main.js' do
  coffee :main
end

# Configurations
set :haml, { ugly: true, format: :html5 }
set :public_folder, File.dirname(__FILE__) + '/public'

configure do
  use Rack::Session::Cookie, key: 'rack.session',
                             path: '/',
                             expire_after: 2592000,
                             secret: 'd4963334c2748abf3ac9ebefbc31928c'
  use Rack::Csrf, raise: true, skip: ['POST:/']
end

helpers do
  include TagHelper
  include FormHelper
  include TemplateHelper
  include TextHelper
end
