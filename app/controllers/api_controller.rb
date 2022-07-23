class ApiController < ApplicationController
  def user_posts
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts, status: :ok
  end

  def user_post_comments
    @comments = Comment.find_by(post_id: params[:post_id])
    render json: @comments, status: :ok
  end

  def new_comment
    post = Post.find(params[:post_id])
    @comment = post.comment.new(user: current_user, text: params[:text])
    if @comment.save
      render json: @comment, status: :ok
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
