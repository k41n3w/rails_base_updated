# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Post /login' do
    it 'should login with correct data' do
      create(:user)

      post sign_in_path, params: { user: { email: 'kaineo@hotmail.com', password: 'qwe123' } }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:session]).not_to be_nil
    end

    it 'should not login with incorrect data' do
      post sign_in_path, params: { user: { email: 'wrong@email.com', password: 'wrongpassword' } }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:unauthorized)
      expect(json[:error]).to eq('Cant find user')
    end

    it 'should not login with incorrect data' do
      create(:user)

      post sign_in_path, params: { user: { email: 'kaineo@hotmail.com', password: 'wrongpassword' } }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:unauthorized)
      expect(json[:error]).to eq('Wrong password')
    end
  end

  describe 'Post /create', type: :request do
    it 'should create user with correct data' do
      user = attributes_for(:user)

      post user_create_path, params: { user: user }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:created)
      expect(json[:user]).not_to be_nil
    end

    it 'should not create user with incorrect data' do
      post user_create_path, params: { user: {} }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:internal_server_error)
      expect(json[:message]).to include('param is missing or the value is empty')
    end
  end

  describe 'Patch /update', type: :request do
    before do
      @user = create(:user)
      post sign_in_path, params: { user: { email: @user.email, password: @user.password } }
      json = JSON.parse(response.body, symbolize_names: true)
      @token = json[:session]
    end

    it 'should update user with correct token' do
      patch user_update_path, params: { user: { name: 'Nome Novo', email: 'email@novo.com.br', password: 'qwenovo' } },
                              headers: { Authorization: @token }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:message]).to eq('User: Nome Novo updated!')
      expect(@user.reload.name).to eq('Nome Novo')
      expect(@user.reload.email).to eq('email@novo.com.br')
    end
  end

  describe 'Get /show', type: :request do
    before do
      @user = create(:user)
      post sign_in_path, params: { user: { email: @user.email, password: @user.password } }
      json = JSON.parse(response.body, symbolize_names: true)
      @token = json[:session]
    end

    it 'should show user with correct token' do
      get user_path, headers: { Authorization: @token }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:user]).not_to be_nil
    end
  end
end
