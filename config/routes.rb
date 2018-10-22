Rails.application.routes.draw do
  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/recipes/shortest' => 'recipes#shortest'
  get '/recipes/name' => 'recipes#name'
  get '/recipes/recent' => 'recipes#recent'
  get '/auth/github/callback' => 'sessions#create'

  resources :users, only: [:new, :create] do
    resources :recipes, except: [:show, :destroy]
  end
  resources :recipes, except: [:new, :create, :edit, :update]
  resources :ingredients, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
