Rails.application.routes.draw do
  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'
  get '/landing' => 'recipes#landing'

  resources :users, only: [:new, :create] do
    resources :recipes, except: [:show, :destroy]
  end
  resources :recipes, only: [:index, :show, :destroy]
  resources :ingredients, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
