Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "categories#index"
  resources :categories, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  # resources :recipes, only: [:index, :show, :new, :update]
  resources :bookmarks, only: [:destroy]

  # get '/categories/:id', to: 'categories#show', as: :category

  # root 'recipes#index'
  # get 'recipes/new', to: 'recipes#new', as: :new_recipe
  # post '/recipes', to: 'recipes#create'
  # get '/recipes/:id', to: 'recipes#show', as: :recipe
  # delete '/recipes/:id', to: 'receipes#destroy'

end

#verb, uri, controller#action
