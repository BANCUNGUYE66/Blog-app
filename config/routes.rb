Rails.application.routes.draw do
  # Users routes
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  # Posts routes
  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show', as: 'post'
end
