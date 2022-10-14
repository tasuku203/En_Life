class Users::HomesController < ApplicationController
  def top
    
    @posts = Post.order(created_at: :DESC).limit(5)
  end

  def about
  end
end
