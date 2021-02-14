# frozen_string_literal: true

require 'swagger_helper'

describe 'Content' do
  path '/content/show' do
    get 'Retorna as informações do sistema' do
      tags 'Content'
      description 'Modelo de documentação para APIs contendo as informações da rota'
      consumes 'application/json'

      response '200', 'blog created' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['developed_by']).to eq('k41n3w')
        end
      end
    end
  end
end
