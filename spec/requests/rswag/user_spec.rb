# frozen_string_literal: true

require 'swagger_helper'

describe 'User' do
  path '/user/login' do
    post 'Efetua login e gera chave criptografada' do
      tags 'User'
      description 'Endpoint para gerar chave criptografada de login'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, example: 'kaineo@hotmail.com' },
              password: { type: :string, example: 'qwe123' }
            }
          }
        },
        required: %w[email password]
      }
      produces 'application/json'

      response '200', 'Login efetuado Com Sucesso!' do
        let(:user) { create(:user) }
        let(:params) { { user: { email: 'kaineo@hotmail.com', password: 'qwe123' } } }
        run_test!
      end
    end
  end
end
