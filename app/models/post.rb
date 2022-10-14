class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # refileが指定のカラムにアクセスするためにattachmentメソッドを追加
  attachment :post_image
end
