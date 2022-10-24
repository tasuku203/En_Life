class Users::HomesController < ApplicationController
  def top
    @user = User.find(current_user.id)
    @followings = @user.followings
    @posts = Post.where(user_id: @followings).order(created_at: :DESC).limit(5)
  end

  def about
  end


end
