Rails.application.routes.draw do
  get 'content/show'
  root to: 'content#show'
end
