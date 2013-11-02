require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :a_id, :location, :name, :description  
  has_attached_file :location
end
