class SessionJwtDecoder
  def initialize(token)
    @token = token
    
  end

  def call
    decoded = JWT.decode(@token, Rails.application.credentials.secret_key_base)[0]
    HashWithIndifferentAccess.new decoded
  end

end