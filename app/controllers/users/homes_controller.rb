class Users::HomesController < ApplicationController
  def top
    @user = User.find(current_user.id)
    @followings = @user.followings
    @posts = Post.where(user_id: @followings).order(created_at: :DESC).page(params[:page]).per(4)
    @posts_all = Post.all.order(created_at: :DESC).page(params[:page]).per(4)
  end

  def about
  end

end
