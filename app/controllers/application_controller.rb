class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_user
    decode_token = self.decode_token
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(user_id.to_s)
    end
  end

  def authorized
    render json: { message: 'You have to login.' }, status: :unauthorized unless authorized_user
  end
end
