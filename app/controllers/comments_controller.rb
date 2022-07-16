class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.user = Current.user
    post = Post.find_by(id: params[:post_id])
    @comment.post = post
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to user_post_path(post.user, post)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
