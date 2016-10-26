# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'
  root 'restaurants#index'

  get 'profiles/show'
  get 'carts/show'
  get 'tags/:tag', to: 'restaurants#index', as: :tag

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations' }

  resources :restaurants, only: [:index, :show] do
    resources :products, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :reservations, only: [:new, :create]
    put :favorite, on: :member
  end

  resource :dashboard, only: [:show]

  namespace :dashboard do
    resources :restaurants, except: [:index, :destroy] do
      post :import
      resources :products
      resources :categories
      resources :roles
      resources :positions
      resources :tables
      resources :orders, only: [:index, :edit, :update]
      resources :reservations
      resources :order_items, only: [:index, :show, :update]
      resource :menus, only: [:show]
    end
  end

  resource :profile, only: [:show] do
    member do
      get :help
      get :report
      get :contact
    end
  end
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders do
    member do
      get :pay
    end
  end
end
