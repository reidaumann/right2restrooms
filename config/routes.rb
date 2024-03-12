Rails.application.routes.draw do
  resources :favorites
  resources :reviews

  root "bathrooms#index"
  devise_for :users
  resources :bathrooms
  # root "articles#index"
end
