require "paperclip/storage/ftp"
class Photo < ActiveRecord::Base
  attr_accessible :picture, :name, :description  
  attr_accessible  :picture, :picture_file_name
  attr_accessible :picture_content_type, :picture_file_size, :picture_updated_at
  has_attached_file :picture,
    :storage => :ftp,
    :path => "/wisdomsun.org/dev/:class/:attachment/:id/:style/:filename",
    :url => "http://wisdomsun.org/dev/:class/:attachment/:id/:style/:filename",
    :ftp_servers => [ {
      :host => ENV['FTP_HOST'],
      :user => ENV['FTP_USERNAME'],
      :password => ENV['FTP_PASSWORD'],
      :passive => true
      } ]

  belongs_to :album
end
