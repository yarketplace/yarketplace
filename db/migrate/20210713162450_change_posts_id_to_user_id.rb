class ChangePostsIdToUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :poster_id, :user_id
  end
end
