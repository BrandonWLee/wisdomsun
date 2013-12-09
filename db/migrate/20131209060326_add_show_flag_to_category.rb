class AddShowFlagToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :show_in_menu, :boolean
  end
end
