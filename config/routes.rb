Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  post 'user/create', as: :user_create
  post 'user/login', as: :sign_in
  patch 'user/update', as: :user_update
  get 'user/show', as: :user
  get 'content/show', as: :content
  
  root to: 'content#show'
end
