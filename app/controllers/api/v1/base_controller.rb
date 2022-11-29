class Api::V1::BaseController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # find the secret
  HMAC_SECRET = Rails.application.credentials.dig(:jwt, :hmac_secret)
end
