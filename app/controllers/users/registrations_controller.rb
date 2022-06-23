class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    token = encode_token({user_id: current_user.id})
    render json: {
      message: 'Signed up successfully',
      user: current_user,
      token: token
    }, status: :created
  end

  def register_failed
    render json: {
      message: 'Sign up failed'
    }, status: :unprocessable_entity
  end
end