class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def create
    # dataを新規登録するためのインスタンス作成
    post = Post.new(post_params)
    post.user_id = current_user.id
    # dataをdataベースに保存するためのsaveメソッドを実行
    post.save
    redirect_to posts_path(post.id)
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def confirm
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :genre)
  end
end
