Rails.application.routes.draw do
  resources :transactions
  resources :sources
  devise_for :users
  get 'home/index'

  authenticated :user do
    root "transactions#index", as: 'authenticated_root'
  end

  # Defines the root path route ("/")
  root "home#index"
end
