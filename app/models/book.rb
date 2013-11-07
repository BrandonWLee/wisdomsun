require "paperclip/storage/ftp"
class Book < ActiveRecord::Base
  attr_accessible :author, :description, :purchase_url, :title
  attr_accessible  :picture, :picture_file_name
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
end
