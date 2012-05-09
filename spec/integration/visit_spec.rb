# -*- coding: utf-8 -*-

require 'spec_helper'

describe 'GET /' do
  it "status should be 200" do
    get '/'
    last_response.ok?.should be_true
  end
end
