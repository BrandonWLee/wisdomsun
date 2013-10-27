class AddAttachmentPictureToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :books, :picture
  end
end
