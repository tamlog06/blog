Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  root 'posts#index'
  get '/sign_up', to: 'sessions#new'
  get '/login', to: 'sessions#log_in'
  # post '/login', to: 'sessions#log_in'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
