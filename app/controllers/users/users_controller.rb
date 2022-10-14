class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def confirm
  end
  
  def destroy
  end
  
  def like
  end
  
  def following
  end
  
  def follower
  end
  
end
