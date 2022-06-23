class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = authorized_user
    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid username of password' }, status: :unprocessable_entity
    end
  end
end
