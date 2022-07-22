class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    post = Post.find_by(id: params[:post_id])
    @comment.post = post
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to user_post_path(post.user, post)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comment.find(params[:id])
    @user = current_user
    @post.comments_counter -= 1
    @comment.destroy!
    redirect_to user_post_path(@user.id, @post.id), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.permit(:text)
  end
end
