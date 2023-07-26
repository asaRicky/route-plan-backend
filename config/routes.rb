Rails.application.routes.draw do
  resources :route_visits
  resources :route_plans
  resources :outlets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
