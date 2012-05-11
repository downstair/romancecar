# -*- coding: utf-8 -*-

require 'spec_helper'

describe TagHelper do
  before :each do
    extend TagHelper
  end

  describe '.a_tag' do
    it "makes a tag to link another page." do
      name = 'Link'
      href = 'http://example.com'
      options = { title: 'Title' }
      a_tag(name, href, options).should include(name)
      a_tag(name, href, options).should include(href)
      a_tag(name, href, options).should include(options[:title])
    end
  end

  describe '.img_tag' do
    it "makes img tag to show image." do
      src = 'http://example.com/a.jpg'
      options = { title: 'Title' }
      img_tag(src, options).should include(src)
      img_tag(src, options).should include(options[:title])
    end
  end
end
