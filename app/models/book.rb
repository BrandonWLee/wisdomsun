require "paperclip/storage/ftp"
class Book < ActiveRecord::Base
  attr_accessible :author, :description, :purchase_url, :title
  attr_accessible :picture, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at
  has_attached_file :picture,
    :path => "/wisdomsun.org/dev/:filename",
    :url => "http://wisdomsun.org/dev/:filename"
end
