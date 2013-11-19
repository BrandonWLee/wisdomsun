class CreateAroundTheWebPosts < ActiveRecord::Migration
  def change
    create_table :around_the_web_posts do |t|
      t.string  :title
      t.string  :external_link
      t.text    :commentary

      t.timestamps
    end
  end
end
