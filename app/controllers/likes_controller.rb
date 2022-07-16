class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @new_like = Current.user.like.new
    @new_like.post_id = @post.id
    if @new_like.save
      flash[:notice] = 'Like created successfully'
      redirect_to user_post_path(@post.user, @post.id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
