# -*- coding: utf-8 -*-

class Setting
  include Mongoid::Document
  include Mongoid::Timestamps
  field :description, type: String
  field :keywords, type: Array
  field :site_title, type: String
end
