class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false
      t.string :profile_image_id


      t.timestamps
    end
  end
end
