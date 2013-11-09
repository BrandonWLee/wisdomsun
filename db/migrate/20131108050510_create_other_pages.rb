class CreateOtherPages < ActiveRecord::Migration

  def up
    create_table :other_pages do |t|
	  t.text :body
	  t.belongs_to :category
	  t.string :title
      t.timestamps
    end
  end

  def down
    drop_table :other_pages
  end
end
