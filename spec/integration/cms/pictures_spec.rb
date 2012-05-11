# -*- coding: utf-8 -*-

require 'spec_helper'

describe 'cms/pictures' do
  describe 'GET /cms/pictures' do
    before :each do
      @picture = Picture.new
      f = open(File.join(File.dirname(__FILE__), '/../../../public/img/rails.png'))
      @picture.uploader = f
      @picture.save
      f.close
    end

    it "status should be 200" do
      get '/cms/pictures'
      last_response.ok?.should be_true
    end
  end
end
