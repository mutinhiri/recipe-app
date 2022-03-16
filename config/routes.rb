Rails.application.routes.draw do
  resources :inventories
  resources :recipes
  devise_for :users
  resources :foods
  get '/foods', to: 'foods#index', as: 'index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'
end
