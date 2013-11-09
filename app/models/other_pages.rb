class OtherPages < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :body, :category_id
  belongs_to :category
end
