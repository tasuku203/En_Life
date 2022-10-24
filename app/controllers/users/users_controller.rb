class Users::UsersController < ApplicationController
  before_action :set_user, except: [:index, :search]

  def index
    @users = User.all
  end

  def show
    @relationship = current_user.active_relationships.find_by(followed_id: @user.id)

    @set_relationship = current_user.active_relationships.new
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(current_user)
      
  end

  def confirm
  end

  def destroy
  end

  def like
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

  def following
    @users = @user.followings
  end

  def follower
    @users = @user.followers
  end

  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :profile, :profile_image)
  end

end
