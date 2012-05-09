# -*- coding: utf-8 -*-

require 'spec_helper'

describe Picture do
  before :each do
    @picture = Picture.new
  end

  describe '.save' do
    it "works successfully." do
      @picture.save.should == true
    end
  end

  describe '.uploader' do
    it 'enable to upload images into database' do
      f = open(File.join(File.dirname(__FILE__), '/../../public/img/rails.png'))
      @picture.uploader?.should be_false
      @picture.uploader = f
      @picture.save
      f.close
      @picture.reload
      @picture.uploader?.should be_true
      @picture.uploader.url.should =~ %r(/grid/p/\w+/rails\.png)
    end
  end
end
