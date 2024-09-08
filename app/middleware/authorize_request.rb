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
      @decoded = SessionAuthenticator.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue JWT::DecodeError
      raise Exception.new 'Invalid or expired token'
    end
    @app.call(env)
  end
end