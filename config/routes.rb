# frozen_string_literal: true
Rails.application.routes.draw do
  root 'restaurants#index'

  get 'carts/show'
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :restaurants, only: [:index, :show] do
    resources :products, only: [:index, :show]
    resources :categories, only: [:index, :show]
  end

  resource :dashboard, only: [:show]

  namespace :dashboard do
    resources :restaurants, except: [:index, :destroy] do
      resources :products
      resources :categories
      resources :roles
      resources :positions
      resources :tables
      resources :orders, only: [:index, :edit, :update]
    end
  end

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :edit, :create, :update, :destroy] do
    member do
      get :pay
    end
  end
end
