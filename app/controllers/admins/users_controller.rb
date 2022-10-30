class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all.page(params[:page]).per(3)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.followers
  end

  
  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
  private
  def user_params
    params.require(:user).permit(:is_active)
  end
  
end
