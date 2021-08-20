Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get 'sessions/new'
  get 'users/new'
  root 'posts#index'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
