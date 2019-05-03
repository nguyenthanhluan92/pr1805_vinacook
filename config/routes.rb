Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

  resources :carts, only: [:index, :destroy]
  resources :reviews, except: :update
  resources :product_orders
  resources :products
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :login_checkouts
  resources :checkouts, only: [:new, :index, :create]
  resource :orders, only: :update
  resource :address, only: [:create, :update]
  resource :searchs, only: :create

  namespace :admin do
    root "dashboard#index"
    get "dashboard/index"
    resources :products
    resources :categories
    resources :users
  end
end
