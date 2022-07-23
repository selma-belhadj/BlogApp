class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(params[:email])

    if user&.valid_password?(params[:password])
      @current_user = user
      render json: @current_user, status: :ok
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def sign_in_params
    params.permit(:email, :password)
  end
end
