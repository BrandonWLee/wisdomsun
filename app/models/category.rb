class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :position
  has_many :other_pagess
end
