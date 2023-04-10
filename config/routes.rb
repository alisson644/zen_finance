Rails.application.routes.draw do
  resources :categories
  resources :movimentations
  resources :sources
  devise_for :users
  get 'home/index'

  authenticated :user do
    root "movimentations#index", as: 'authenticated_root'
  end

  # Defines the root path route ("/")
  root "home#index"
end
