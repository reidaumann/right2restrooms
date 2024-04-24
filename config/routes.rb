Rails.application.routes.draw do

  root "bathrooms#landing_page"

  devise_for :users
  get 'users/:id', to: 'users#show', as: 'dynamic_user'
  
  resources :bathrooms
  resources :bathrooms do
    resources :favorites, only: [:create, :destroy]
  end
  resources :reviews,  only: [:create, :destroy]
end
