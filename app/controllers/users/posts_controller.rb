class Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    # dataを新規登録するためのインスタンス作成
    post = Post.new(post_params)
    #投稿のuser_idはログイン中のユーザーidに指定
    post.user_id = current_user.id
    # dataをdataベースに保存するためのsaveメソッドを実行
    post.save
    flash[:notice] = "投稿に成功しました!!"
    redirect_to index_user_post_path(post.user_id)
  end

  def index
    # ページネーションを使う
    @posts = Post.all.page(params[:page]).per(3)
  end

# 最初はindexアクションを定義していたがユーザーごとの投稿一覧ページを実装する必要があったので新しいアクションindex_userを追加して
# urlにuser_idを含むposts/user_id/index_userというルーティングを作った。
  def index_user
    @user = User.find(params[:id])
     # 特定のユーザーの投稿一覧だけを取得したいのでwhereメソッドを使う
    # モデル.where(条件)
    @posts = Post.where(user_id:params[:id]).order(created_at: :desc).page(params[:page]).per(2)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  # 画像の詳細（拡大）表示
  def show_image
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



  # def search
  #   @posts = Post.search(params[:keyword]).page(params[:page]).per(5)
  #   @keyword = params[:keyword]
  #   render "index"

  # end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :genre)
  end
end
