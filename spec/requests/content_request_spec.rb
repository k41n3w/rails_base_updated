# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contents', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/content/show'
      json = JSON(response.body)

      expect(response).to have_http_status(:success)
      expect(json['ruby_version']).to eq('3.0.0')
      expect(json['rails_version']).to eq('6.1.1')
      expect(json['credentials_key']).to eq(Rails.application.credentials[Rails.env.to_sym][:SOME_KEY])
      expect(json['developed_by']).to eq('k41n3w')
    end
  end
end
