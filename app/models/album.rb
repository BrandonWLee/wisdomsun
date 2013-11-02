require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :a_id, :name, :description, :album_cover
  has_attached_file :album_cover
end