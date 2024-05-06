# Good clean routes, good use of helpers
Rails.application.routes.draw do

  root "bathrooms#landing_page"

  devise_for :users
  get 'users/:id', to: 'users#show', as: 'dynamic_user'
  
  # don't need this since it's defined again DRY
  resources :bathrooms

  resources :bathrooms do
    resources :favorites, only: [:create, :destroy]
  end
  resources :reviews,  only: [:create, :destroy]
end
