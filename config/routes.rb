Rails.application.routes.draw do

  root "bathrooms#index"

  devise_for :users
  get '/users/:id', to: 'users#show'
  
  resources :bathrooms
  resources :bathrooms do
    resources :favorites, only: [:create, :destroy]
  end
  resources :reviews,  only: [:create, :destroy]
end
