class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user: params[:user_id]) 
  end

  def show; end
end
