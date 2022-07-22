class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @last_five_comments = @post.five_recent_comments
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
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

  def destroy
    @post = Post.find(params[:id])
    @user = current_user
    @user.posts_counter -= 1
    @post.destroy!
    redirect_to user_posts_path(@post.user), notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
