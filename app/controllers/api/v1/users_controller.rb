class Api::UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
  end
end
