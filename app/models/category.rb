class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :position, :refactored_name
  has_many :other_pagess
  validates_presence_of :name, :position, :refactored_name
  validates :position, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  validates_uniqueness_of :refactored_name, :position
end
