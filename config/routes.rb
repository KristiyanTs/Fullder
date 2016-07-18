Rails.application.routes.draw do

  root 'restaurants#index'
  
  get 'carts/show'

  devise_for :users

  resources :restaurants do
    resources :products
    resources :categories
    resources :roles
    resources :positions
    resources :tables
  end

  resource :dashboard, only: [:show]

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :edit, :create, :update, :destroy]
end
