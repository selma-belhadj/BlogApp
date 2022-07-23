require 'jwt'

class TokenAuthorization
  extend ActiveSupport::Concern

  HMAC_SECRET = 'authorization#password'.freeze

  def self.jwt_encode(email)
    payload = { email: }
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end

  def self.jwt_decode(token)
    JWT.decode token, HMAC_SECRET, true, { algorithm: 'HS256' }
  end
end
