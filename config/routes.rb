Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :recipes [:index, :new, :create]
  end
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
