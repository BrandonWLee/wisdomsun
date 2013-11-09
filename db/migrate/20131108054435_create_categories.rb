class CreateCategories < ActiveRecord::Migration

  def up
    create_table :categories do |t|
	  t.string :name
	  t.integer :position
    t.string :refactored_name
    t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end
