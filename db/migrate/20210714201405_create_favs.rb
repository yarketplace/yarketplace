class CreateFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :favs do |t|
      t.references :user, null: false, foreign_key: true # meaning? 
      t.references :post, null: false, foreign_key: true # meaning?
      t.timestamps
      t.index [:user_id, :post_id], unique: true   # Preventing the same user making own post favoriate 
    end
  end
end
