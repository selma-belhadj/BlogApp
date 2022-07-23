class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(sign_up_params)
    p user
    if user.save!
      token = user.generate_jwt
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.permit(:email, :name, :password)
  end
end
