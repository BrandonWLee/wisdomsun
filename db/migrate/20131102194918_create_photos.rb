class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.integer :p_id
      t.integer :a_id
      t.string :location
      t.string :name
      t.text :description      
    end
    create_table :albums do |t|
      t.integer :a_id
      t.string :name
      t.text :description
      t.string :loc_of_albumcover
    end
  end

  def down
    drop_table :photos
    drop_table :albums
  end
end
