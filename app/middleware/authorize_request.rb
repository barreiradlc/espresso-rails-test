class AuthorizeRequest
  def initialize(app)
    @app = app
  end

  def call(env)
    @path = env['ORIGINAL_FULLPATH']

    if @path == '/' || @path == '/login' || @path == '/register'
      return @app.call(env)
    end

    header = env['HTTP_AUTHORIZATION']
    header = header.split(' ').last if header

    begin
      session_jwt_decoder = SessionJwtDecoder.new(header)
      @decoded = session_jwt_decoder.call
      $current_user = User.find(@decoded[:user_id])
    rescue JWT::DecodeError => e
      render json: { error: 'Invalid or expired token' }, status: :unauthorized
    end
    @app.call(env)
  end
end