class SessionJwtDecoder
  def initialize(token)
    @token = token
  end

  def call
    jwt_secret = ENV['JWT_SECRET']

    decoded = JWT.decode(@token, jwt_secret)[0]
    HashWithIndifferentAccess.new decoded
  end

end