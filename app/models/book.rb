class Book < ActiveRecord::Base
  attr_accessible :author, :description, :picture, :purchase_url, :title
end
