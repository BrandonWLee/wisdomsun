require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :a_id, :picture, :name, :description  
  has_attached_file :picture
    :path => "/wisdomsun.org/dev/:filename",
    :url => "http://wisdomsun.org/dev/:filename"
end
