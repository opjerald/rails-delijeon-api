Rails.application.routes.draw do
  resources :users, only: [:create]
  post '/login', to: 'users#login'
  namespace :api do
    resources :categories
    resources :products
    resources :carts, only: %i[show destroy create] do
      resources :cart_items
    end
    resources :orders, only: %i[show destroy create] do
      resources :order_items, only: %i[index show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
