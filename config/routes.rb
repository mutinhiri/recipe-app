Rails.application.routes.draw do    
  resources :recipes do
    resources :recipe_foods
  end
  devise_for :users
  resources :foods
  get '/foods', to: 'foods#index', as: 'index'
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'

  resources :inventories do
    resources :inventory_foods
  end
end
