# frozen_string_literal: true

class SessionJwtDecoder
  def initialize(token)
    @token = token
  end

  def call
    jwt_secret = ENV.fetch('JWT_SECRET', nil)

    decoded = JWT.decode(@token, jwt_secret)[0]
    ActiveSupport::HashWithIndifferentAccess.new decoded
  end
end
