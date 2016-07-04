Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  devise_for :users

  resources :restaurants do
    resources :products
    resources :categories
  end
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
