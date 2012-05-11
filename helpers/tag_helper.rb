# -*- coding: utf-8 -*-

module TagHelper
  def a_tag(name, href = nil, options = {})
    if href.blank?
      href = name
    end
    attrs = tag_attributes(options)
    "<a href=\"#{href}\"#{attrs}>#{name}</a>"
  end

  def img_tag(src, options = {})
    attrs = tag_attributes(options)
    "<img src=\"#{src}\"#{attrs} />"
  end

  def tag_attributes(options)
    attrs = ""
    options.each do |key, value|
      attrs += " #{key}=\"#{value}\""
    end
    attrs
  end
end
