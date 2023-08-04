Rails.application.routes.draw do
  resources :check_ins
  resources :route_plans
  resources :merchandisers
  resources :sales_managers
  resources :outlets
  resources :users
 post "/login", to: "users#login"
  post '/signup', to: 'users#signup'
  delete '/logout', to: 'users#logout'

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  post "/register", to: "sessions#authenticate"
  delete "/logout", to: "sessions#destroy"
  patch '/reset_password', to: 'users#reset_password'
  
end
