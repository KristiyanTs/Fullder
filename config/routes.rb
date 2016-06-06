Rails.application.routes.draw do
  devise_for :users

  resources :restaurants
	resources :menus do
		patch :activate
	end
  resources :categories
end
