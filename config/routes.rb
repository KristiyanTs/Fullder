Rails.application.routes.draw do
  get 'carts/show'

  devise_for :users

  resources :restaurants do
    resources :products
    resources :categories
    resources :roles
  end
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
