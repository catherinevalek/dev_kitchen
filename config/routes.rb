Rails.application.routes.draw do
  get '/searches', to: 'recipes#index'
  get  '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes
  resources :categories
  resources :menus
  root to: 'pages#home'
end
