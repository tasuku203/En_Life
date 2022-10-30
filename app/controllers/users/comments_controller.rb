class Users::CommentsController < ApplicationController
before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id)
  end

  def create
    # post#showページのコメント投稿formのなかみのアクションです
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id= post.id
    comment.save
    redirect_to post_comments_path(post)
  end

  def destroy
    # find_byメソッドをつかっていたがこちらでもできた。いまいち理解できていない。
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(post.id)
  end



  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end

end
