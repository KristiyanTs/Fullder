Rails.application.routes.draw do
  root 'restaurants#index'

  get 'carts/show'
  get 'tags/:tag', to: 'restaurants#index', as: :tag

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :restaurants, only: [:index, :show] do
    resources :products, only: [:index, :show]
    resources :categories, only: [:index, :show]
    put :favorite, on: :member
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
