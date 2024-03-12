Rails.application.routes.draw do

  root "bathrooms#index"

  devise_for :users
  
  resources :bathrooms
  resources :favorites
  resources :reviews
  # root "articles#index"
end
