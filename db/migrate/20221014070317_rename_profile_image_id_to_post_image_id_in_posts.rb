class RenameProfileImageIdToPostImageIdInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :profile_image_id, :post_image_id
  end
end
