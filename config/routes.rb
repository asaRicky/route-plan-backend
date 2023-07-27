Rails.application.routes.draw do
  resources :route_visits
  resources :route_plans, only: [:show, :create, :update, :destroy]
  resources :outlets, only: [:index, :show, :create, :update, :destroy]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  post "/register", to: "sessions#authenticate"
  delete "/logout", to: "sessions#destroy"
  patch '/reset_password', to: 'users#reset_password'
end
