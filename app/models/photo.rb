require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :picture, :name, :description, :album_id  
  attr_accessible :picture_file_name # had another picture variable --> removed

  attr_accessible :picture_content_type, :picture_file_size, :picture_updated_at
  has_attached_file :picture,
    :styles => { :medium => ["300x300"], :thumb => ["32x32#"], :small => ["100x100#"] },
    :storage => :ftp,
    :path => "/wisdomsun.org/dev/:class/:attachment/:id/:style/:filename",
    :url => "http://wisdomsun.org/dev/:class/:attachment/:id/:style/:filename",
    :ftp_servers => [ {
      :host => ENV['FTP_HOST'],
      :user => ENV['FTP_USERNAME'],
      :password => ENV['FTP_PASSWORD'],
      :passive => true
      } ]

  validates_attachment :picture, 
    :content_type => { :content_type => ["image/png", "image/jpg", "image/jpeg"] }
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
