require "paperclip/storage/ftp"
class Slider < ActiveRecord::Base
  attr_accessible :link, :name
  attr_accessible  :picture, :picture_file_name
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

end
