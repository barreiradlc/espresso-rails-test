# frozen_string_literal: true

class SessionJwtEncoder
  def initialize(payload, expire_duration = 24.hours)
    @payload = payload
    @expire_duration = expire_duration
  end

  def call
    jwt_secret = ENV.fetch('JWT_SECRET', nil)

    @payload[:exp] = Time.now.to_i + @expire_duration.to_i
    JWT.encode(@payload, jwt_secret)
  end
end
