class RedactorRails::Document < RedactorRails::Asset
  has_attached_file :data,
    :storage => :ftp,
    :path => "/wisdomsun.org/dev/:class/:attachment/:id/:filename",
    :url => "http://wisdomsun.org/dev/:class/:attachment/:id/:filename",
    :ftp_servers => [ {
      :host => ENV['FTP_HOST'],
      :user => ENV['FTP_USERNAME'],
      :password => ENV['FTP_PASSWORD'],
      :passive => true
      } ]
  
  validates_attachment_size :data, less_than: 100.megabytes
  validates_attachment_presence :data

  def url_content
    url(:content)
  end
  
end
