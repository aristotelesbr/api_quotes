# frozen_string_literal: true

# Simple authenticate from native rails
module Authenticable
  extend ActiveSupport::Concern
  TOKEN = 'mysecret'

  included do
    before_action :authenticate_with_token!
  end

  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate_with_token!
    return if authenticate
    render json: { errors: 'Unauthorized access!' }, status: 401
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      # Compare the tokens in a time-constant manner, to mitigate
      # timing attacks.
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end
end
