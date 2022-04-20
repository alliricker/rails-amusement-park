Rails.application.routes.draw do
  resources :users
  resources :rides 
  resources :attractions

  root 'users#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get 'signout', to: 'sessions#signout'
  post '/signout', to: 'sessions#destroy'

end
