class OtherPage < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :body, :category_id, :refactored_title
  belongs_to :category
  validates_presence_of :title
  validates :refactored_title, :uniqueness => {:scope => :category_id}
end
