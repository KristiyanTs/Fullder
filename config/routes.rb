Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :menus do
      patch :activate
    end

    resources :categories
  end
end
