Rails.application.routes.draw do
  resources :check_ins
  resources :route_plans
  resources :users
  resources :merchandisers
  resources :sales_managers
  resources :outlets
  
end
