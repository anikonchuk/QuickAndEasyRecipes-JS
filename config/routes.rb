Rails.application.routes.draw do
  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/recipes/shortest' => 'recipes#shortest'
  get '/recipes/name' => 'recipes#name'
  get '/recipes/recent' => 'recipes#recent'

  resources :users, only: [:new, :create, :index] do
    resources :recipes, only: [:index, :new, :create, :edit, :update]
  end
  resources :recipes, except: [:new, :create, :edit, :update]
  resources :ingredients, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
