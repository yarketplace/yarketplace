class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :poster_id
      t.string :title
      t.string :category
      t.float :price
      t.text :desc

      t.timestamps
    end
  end
end
