class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @last_five_comments = @post.five_recent_comments
  end
end
