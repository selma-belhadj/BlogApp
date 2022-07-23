require_relative '../concerns/json_tokens'

class Api::PostsController < ApplicationController
  def index
    return unless check_auth?(params[:user_id])

    @user = User.find(params[:user_id])
    return unless @user.token?

    decoded_token = TokenAuthorization.jwt_decode(@user.token)[0]['email']
    unless decoded_token == @user.email
      render json: { error: 'You are not authorized !!!' }, status: :unauthorized
      nil
    end
    @posts = Post.where(author_id: params[:user_id])
    render json: { success: true, data: { posts: @posts } }
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
end