# -*- coding: utf-8 -*-

class PictureUploader < CarrierWave::Uploader::Base

  storage :grid_fs

  def store_dir
    "p/#{model.id}"
  end

  def scale(width, height)
    # do nothing
  end
end
