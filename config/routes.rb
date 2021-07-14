Rails.application.routes.draw do
  resources :comments
  resources :posts

  resources :users
  get '/home', to: 'users#home', as: 'home'

  get '/signup', to: 'users#new'
  post '/signup-attempt', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :images, only: [:index, :show, :new, :create]
  root 'images#new'
end
