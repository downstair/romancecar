# -*- coding: utf-8 -*-

class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  field :caption, type: String
  mount_uploader :uploader, PictureUploader
  before_save :make_caption

  def make_caption
    return if caption?
    if uploader?
      self.caption = self.uploader_url.sub(/.*\//, '').sub(/\..*$/, '')
    end
    unless caption?
      self.caption = 'Unknown'
    end
  end
end
