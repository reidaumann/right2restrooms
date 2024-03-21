Rails.application.routes.draw do

  root "bathrooms#index"

  devise_for :users
  get '/users/:id', to: 'users#show'
  
  resources :bathrooms
  resources :favorites
  resources :reviews
  # root "articles#index"
end
