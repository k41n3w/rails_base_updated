# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Caio Ramos' }
    email { 'kaineo@hotmail.com' }
    password { 'qwe123' }
  end
end
