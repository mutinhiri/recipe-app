Rails.application.routes.draw do
  devise_for :users
  resources :foods
  get '/foods', to: 'foods#index', as: 'index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'

  resources :inventories do
    resources :inventory_foods
  end
end
