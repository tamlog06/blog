Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get 'sessions/new'
  get 'users/new'
  root 'posts#index'
  get '/sign_up', to: 'users#new'
  get '/login', to: 'users#log_in'
  # post '/login', to: 'sessions#log_in'
  delete '/logout', to: 'users#destroy'
  resources :users
end
