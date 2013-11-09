class CreatePhotosAndAlbums < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.belongs_to :album
      t.attachment :picture
      t.text :description    
    end
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.attachment :album_cover # album cover
    end
  end

  def down
    drop_table :photos
    drop_table :albums
  end
end
