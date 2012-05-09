# -*- coding: utf-8 -*-

require 'spec_helper'

describe 'GET /grid/p/:id/:filename' do
  before :each do
    @picture = Picture.new
    f = open(File.join(File.dirname(__FILE__), '/../../public/img/rails.png'))
    @picture.uploader = f
    @picture.save
    f.close
  end

  it "status should be 200" do
    get @picture.uploader_url
    last_response.ok?.should be_true
    last_response.body[0,10].should include 'PNG'
  end
end
