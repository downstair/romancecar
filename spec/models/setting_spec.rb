# -*- coding: utf-8 -*-

require 'spec_helper'

describe Setting do
  before :each do
    @setting = Setting.new
  end

  describe '.save' do
    it "works successfully." do
      @setting.save.should == true
    end
  end
end
