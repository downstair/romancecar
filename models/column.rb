# -*- coding: utf-8 -*-

class Column
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :description, type: String
  field :title, type: String
  field :top_page, type: Boolean
end
