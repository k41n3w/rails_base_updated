# frozen_string_literal: true

class ContentController < ApplicationController
  def show
    render json: {
      rails_env: Rails.env,
      ruby_version: '3.0.0',
      rails_version: '6.1.1',
      credentials_key: Rails.application.credentials[Rails.env.to_sym][:SOME_KEY],
      developed_by: 'k41n3w'
    }, status: :ok
  end
end
