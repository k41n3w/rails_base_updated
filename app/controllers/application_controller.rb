# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_error

  private

  def render_error(exception)
    render json: { message: exception.message, backtrace: exception.backtrace },
           status: :internal_server_error
  end
end
