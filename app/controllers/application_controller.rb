# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize!
  rescue_from StandardError, with: :render_error

  def find_user_by_token
    @user ||= User.find_by(id: @decoded_token[0]['user_id'].to_i)
  end

  private

  def authorize!
    request_token = request.headers['Authorization']&.split(' ')&.last

    raise 'Must pass Authorization Token on Header' if request_token.nil?

    @decoded_token = JWT.decode request_token, secret, true, { algorithm: 'HS256' }

    raise 'Unauthorized access' unless @decoded_token[0]['user_id'].present?
  end

  def render_error(exception)
    render json: { message: exception.message, backtrace: exception.backtrace },
           status: :internal_server_error
  end

  def secret
    Rails.application.credentials.secret_key_base
  end
end
