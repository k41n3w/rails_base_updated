# frozen_string_literal: true

class ContentController < ApplicationController
  def show
    render json: { rails_env: Rails.env,  ruby_version: '3.0.0', rails_version: '6.1.1' }, status: :ok
  end
end
