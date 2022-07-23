require_relative '../concerns/json_tokens'

class Api::CommentsController < ApplicationController
  def index
    return unless check_auth?(params[:user_id])

    @user = User.find(params[:user_id])
    return unless @user.token?

    decoded_token = TokenAuthorization.jwt_decode(@user.token)[0]['email']
    if decoded_token == @user.email
      @comments = Comment.where({ post_id: params[:post_id] }).order('created_at')
      render json: { success: true, data: { comments: @comments } }, status: :ok
    else
      render json: { error: 'You are not authorized !!!' }, status: :unauthorized
    end
  end

  def create
    return unless check_auth?(params[:user_id])

    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    return unless @user.token?

    decoded_token = TokenAuthorization.jwt_decode(@user.token)[0]['email']
    unless decoded_token == @user.email
      render json: { error: 'You are not authorized !!!' }, status: :unauthorized
      nil
    end
    @comment = Comment.create(author: @user, post: @post, text: comment_params['text'])
    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, errors: @comment.errors }, status: :bad_request
    end
  end

  private

  def check_auth?(user_id)
    user = User.where(id: user_id)
    if user.empty?
      render json: { error: 'You are not authorized !!!' }, status: :unauthorized
      return false
    end
    true
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
white_check_mark
eyes
raised_hands
