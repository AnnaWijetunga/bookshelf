Rails.application.routes.draw do
  resources :genres
  resources :reviews
  resources :users
  resources :books

  get '/auth/:provider/callback' => 'sessions#omniauth'
  # get 'auth/:provider/callback', to: 'sessions#create'
end
