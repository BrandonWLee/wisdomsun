require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :picture, :name, :description, :album_id  
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

  validates_attachment :picture, 
    :content_type => { :content_type => ["image/jpg", "image/jpeg"] }
  belongs_to :album
  
  def self.find_pictures_in_album(id)
    Photo.where(:album_id => id)
  end

  def self.destroy_in_album(id)
    photos = Photo.find_pictures_in_album(id)
    photos.each do |photo|
      photo.destroy
    end
  end
    
end
