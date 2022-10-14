class Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    # dataを新規登録するためのインスタンス作成
    post = Post.new(post_params)
    #
    post.user_id = current_user.id
    # dataをdataベースに保存するためのsaveメソッドを実行
    post.save
    redirect_to index_user_post_path(post.user_id)
  end

# 最初はindexアクションを定義していたがユーザーごとの投稿一覧ページを実装する必要があったので新しいアクションindex_userを追加して
# urlにuser_idを含むposts/user_id/index_userというルーティングを作った。
  def index_user
    # 特定のユーザーの投稿一覧だけを取得したいのでwhereメソッドを使う
    # モデル.where(条件)
    @user = User.find(params[:id])
    @posts = Post.where(user_id:params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def confirm
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to index_user_post_path(@post.user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :genre)
  end
end
