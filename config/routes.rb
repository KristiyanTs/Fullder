Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants
  devise_for :users
end
