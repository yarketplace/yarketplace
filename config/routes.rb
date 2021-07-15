Rails.application.routes.draw do
  
  resources :posts do 
    resources :comments
  end

  resources :users
  resources :favs
  get '/home', to: 'users#home', as: 'home'
  get '/my_posts', to: 'users#my_posts'

  post '/add_fav', to: 'favs#create'
  delete '/delete_fav', to: 'favs#destroy'

  get '/signup', to: 'users#new'
  post '/signup-attempt', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#signout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :images, only: [:index, :show, :new, :create]
  root 'users#home'
end
