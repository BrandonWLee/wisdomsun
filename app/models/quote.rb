class Quote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :quote, :source
  validates_presence_of :quote
end
