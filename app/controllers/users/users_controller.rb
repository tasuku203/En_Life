class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @relationship = current_user.active_relationships.find_by(followed_id: @user.id)
    @set_relationship = current_user.active_relationships.new
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
