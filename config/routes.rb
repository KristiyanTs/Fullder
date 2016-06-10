Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :menus do
      patch :activate
    end

    resources :categories
    resources :meals
    resources :tables
  end

  resources :cart
end
