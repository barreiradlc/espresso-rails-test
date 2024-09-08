class SessionJwtEncoder
  def initialize(payload, expire_duration = 24.hours)
    @payload = payload
    @expire_duration = expire_duration
  end

  def call
    @payload[:exp] = Time.now.to_i + @expire_duration.to_i
    JWT.encode(@payload, Rails.application.credentials.secret_key_base)
  end

end