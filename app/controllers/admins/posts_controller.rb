class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all.page(params[:page]).per(3)
  end
  
  def show
  end
  
  def destroy
  end
  
  def search
    @posts = Post.search(params[:keyword])
    @keyword  = params[:keyword]
    render "index"
  end
end
