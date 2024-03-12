Rails.application.routes.draw do

  root "bathrooms#index"
  devise_for :users
  resources :bathrooms
  # root "articles#index"
end
