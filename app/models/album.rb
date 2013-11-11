require "paperclip/storage/ftp"
class Album < ActiveRecord::Base
  attr_accessible :description, :name, :id
  attr_accessible :album_cover, :album_cover_file_name
  attr_accessible :album_cover_content_type, :album_cover_file_size, :album_cover_updated_at
  has_attached_file :album_cover,
    :storage => :ftp,
    :path => "/wisdomsun.org/dev/:class/:attachment/:id/:style/:filename",
    :url => "http://wisdomsun.org/dev/:class/:attachment/:id/:style/:filename",
    :ftp_servers => [ {
      :host => ENV['FTP_HOST'],
      :user => ENV['FTP_USERNAME'],
      :password => ENV['FTP_PASSWORD'],
      :passive => true
      } ]
  has_many :photos
  validates_attachment :album_cover, 
    :content_type => { :content_type => ["image/jpg", "image/jpeg"] }
end
