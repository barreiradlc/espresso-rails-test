# frozen_string_literal: true

class AuthorizeRequest
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env

    begin
      @decoded = SessionJwtDecoder.new(header).call
      RequestStore[:current_user] = User.find(@decoded[:user_id])
    rescue JWT::DecodeError
      { error: 'Invalid or expired token' }
    end
    @app.call(env)
  end

  private

  def header
    @path = @env['ORIGINAL_FULLPATH']
    return @app.call(@env) if redirect_insecure_paths

    cookies = Rack::Request.new(@env).cookies
    cookies['@expresso_app:jwt'] || @env['HTTP_AUTHORIZATION'].split.last
  end

  def redirect_insecure_paths
    Rails.logger.debug 'REDIRECT'

    return true if @path.include?('favicon' || 'assets')
    return true if insecure_paths.include? @path

    false
  end

  def insecure_paths
    [
      '/',
      '/login',
      '/register',
      '/login_page'
    ]
  end
end
