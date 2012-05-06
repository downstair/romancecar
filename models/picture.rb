# -*- coding: utf-8 -*-

class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  field :caption, type: String
  mount_uploader :uploader, PictureUploader
end
