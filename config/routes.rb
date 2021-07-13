Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  get '/signup', to: 'users#new'
  post '/signup-attempt', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :images, only: [:index, :show, :new, :create]
  root 'images#new'
end
