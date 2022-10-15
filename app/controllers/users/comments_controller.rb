class Users::CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    # post#showページのコメント投稿formのなかみのアクションです
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id= post.id
    comment.save
    redirect_to post_path(post.id)
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
