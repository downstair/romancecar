# -*- coding: utf-8 -*-

require 'spec_helper'

describe Column do
  before :each do
    @column = Column.new
  end

  describe '.save' do
    it "works successfully." do
      @column.save.should == true
    end
  end
end
