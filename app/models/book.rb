class Book < ActiveRecord::Base
  attr_accessible :author, :description, :picture, :purchaseURL, :title
end
