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

      response '200', 'Login Efetuado Com Sucesso!' do
        let!(:user) { create(:user) }
        let(:params) { { user: { email: 'kaineo@hotmail.com', password: 'qwe123' } } }
        run_test!
      end
    end
  end

  path '/user/create' do
    post 'Cria usuário' do
      tags 'User'
      description 'Endpoint para criar usuário'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string, example: 'Caio Ramos' },
              email: { type: :string, example: 'kaineo@hotmail.com' },
              password: { type: :string, example: 'qwe123' }
            }
          }
        },
        required: %w[name email password]
      }
      produces 'application/json'

      response '201', 'Usuário Criado Com Sucesso!' do
        let(:params) { { user: { name: 'Caio Ramos', email: 'kaineo@hotmail.com', password: 'qwe123' } } }
        run_test!
      end
    end
  end

  path '/user/update' do
    patch 'Atualiza usuário a partir do token gerado no login' do
      tags 'User'
      security [Bearer: {}]
      description 'Endpoint para alterar usuário'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string, example: 'Caio Ramos' },
              email: { type: :string, example: 'kaineo@hotmail.com' },
              password: { type: :string, example: 'qwe123' }
            }
          }
        },
        required: %w[name email password]
      }
      produces 'application/json'

      response '200', 'Usuário Criado Com Sucesso!' do
        let!(:user) { create(:user) }
        let!(:Authorization) { Session.new(user).token }
        let(:params) { { user: { name: 'Nome Atualizado', email: 'email@atualizado.com' } } }
        run_test!
      end
    end
  end

  path '/user/show' do
    get 'Exibe usuário a partir do token gerado no login' do
      tags 'User'
      security [Bearer: {}]
      description 'Endpoint para mostrar dados do usuário logado'

      produces 'application/json'

      response '200', 'Informações de Usuário Exibidas Com Sucesso!' do
        let!(:user) { create(:user) }
        let!(:Authorization) { Session.new(user).token }

        run_test!
      end
    end
  end
end
