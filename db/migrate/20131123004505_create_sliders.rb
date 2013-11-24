class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :link
      t.attachment :picture
      t.timestamps
    end
  end
end
