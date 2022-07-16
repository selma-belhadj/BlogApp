class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @last_five_comments = @post.five_recent_comments
  end

  def create
    @post = Post.create(post_params)
    @post.user = Current.user
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_post_path(@post.user, @post)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
