class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :poster_id
      t.text :title
      t.text :category
      t.float :price
      t.text :desc

      t.timestamps
    end
  end
end
