class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
#      t.integer :p_id #picture_id
      t.integer :album_id
      t.attachment :location
      t.string :name
      t.text :description    
      # want to add a_id to be a foreign key for albums.a_id  
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
