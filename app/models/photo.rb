require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :picture, :name, :description  
  attr_accessible :picture_file_name # had another picture variable --> removed

  attr_accessible :picture_content_type, :picture_file_size, :picture_updated_at
  has_attached_file :picture,
    :storage => :ftp,
    :path => "/wisdomsun.org/dev/:class/:attachment/:id/:filename",
    :url => "http://wisdomsun.org/dev/:class/:attachment/:id/:filename",
    :ftp_servers => [ {
      :host => ENV['FTP_HOST'],
      :user => ENV['FTP_USERNAME'],
      :password => ENV['FTP_PASSWORD'],
      :passive => true
      } ]

  belongs_to :album
  
  def self.find_pictures_in_album(album_id)
    photos = []
    Photo.find_by_album(album_id).each do |photo|
      photos << photo.picture.url
    end
    return photos
  end
    
end
