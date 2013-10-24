class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :picture
      t.string :purchaseURL
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
  def down
    drop_table :books
  end
end
