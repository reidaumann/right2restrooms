# frozen_string_literal: true

Rails.application.routes.draw do
  root 'bathrooms#landing_page'

  devise_for :users
  get '/users/:id', to: 'users#show'

  resources :bathrooms
  resources :bathrooms do
    resources :favorites, only: %i[create destroy]
  end
  resources :reviews, only: %i[create destroy]
end
