require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :a_id, :name, :description, :album_cover
  has_attached_file :album_cover
    :path => "/wisdomsun.org/dev/:filename",
    :url => "http://wisdomsun.org/dev/:filename"
end
