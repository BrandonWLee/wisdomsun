class Book < ActiveRecord::Base
  attr_accessible :author, :description, :picture, :purchaseURL, :title
  mount_uploader :picture, BooksUploader
end
