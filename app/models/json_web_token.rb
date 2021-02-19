# frozen_string_literal: true

class JsonWebToken
  def initialize(payload = {})
    @payload = payload
  end

  def encoded(exp = 1.hour.from_now)
    JWT.encode(@payload.merge(exp: exp.to_i), secret, 'HS256')
  end

  def secret
    Rails.application.credentials.secret_key_base
  end
end
