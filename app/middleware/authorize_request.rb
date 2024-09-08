# frozen_string_literal: true

class AuthorizeRequest
  def initialize(app)
    @app = app
  end

  def call(env)
    @path = env['ORIGINAL_FULLPATH']

    return @app.call(env) if @path == '/' || @path == '/login' || @path == '/register'

    header = env['HTTP_AUTHORIZATION'].split.last if env['HTTP_AUTHORIZATION']

    begin
      @decoded = SessionJwtDecoder.new(header).call
      RequestStore[:current_user] = User.find(@decoded[:user_id])
    rescue JWT::DecodeError
      render json: { error: 'Invalid or expired token' }, status: :unauthorized
    end
    @app.call(env)
  end
end
