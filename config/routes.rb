Rails.application.routes.draw do
  devise_for :users, {
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  }

  get '/users/user', to: 'users/users#show'

  namespace :api do
    resources :categories
    resources :products
    resources :carts, only: %i[show destroy create] do
      resources :cart_items
    end
    resources :orders, only: %i[index show create] do
      resources :order_items, only: %i[index show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
