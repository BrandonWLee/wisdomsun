class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :description
      t.string :location
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
