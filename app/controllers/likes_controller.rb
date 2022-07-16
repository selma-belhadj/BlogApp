class LikesController < ApplicationController
    def create
        @user = 
        @like = Like.create(like_params)
        @like.user = Current.user
        post = Post.find(params[:post_id])
        @like.post = post
        if @like.save
            flash[:notice] = "Like created successfully"
            redirect_to user_post_path(post.user, post)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :id)
    end
end
