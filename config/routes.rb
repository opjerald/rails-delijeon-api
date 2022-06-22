Rails.application.routes.draw do

  namespace :api do
    resources :categories
    resources :products
    resources :carts, only: [:show, :destroy, :create] do
      resources :cart_items
    end
    resources :orders, only: [:show, :destroy, :create] do
      resources :order_items, only: [:index, :show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
