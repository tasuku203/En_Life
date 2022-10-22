class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  # refileが指定のカラムにアクセスするためにattachmentメソッドを追加
  attachment :post_image
  # liked_byメソッドを使って引数で渡されたuserのidがlikesテーブルに存在しているかどうかを調べる
  # 存在していたらtrue,していなかったらfalseが返される
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
    
    
  def self.search(keyword)
    where(["title like? or body like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
