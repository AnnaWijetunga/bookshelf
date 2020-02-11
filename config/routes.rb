Rails.application.routes.draw do
  
  root 'static#home'

  get 'books/by_author', to: 'static#author'
  get 'books/by_title', to: 'static#title'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :genres
  resources :reviews
  resources :books, only: [:new, :create, :show]

  resources :users do
    resources :books, only: [:index]
    resources :reviews, only: [:new, :create, :show]
  end

  get '/auth/:provider/callback', to: 'sessions#create'

end
