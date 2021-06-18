Rails.application.routes.draw do
  root to: "welcomes#new"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :stores, only: [:new, :create] do
    resources :users do
      member do
        patch :add_admin
        patch :add_general
      end
    end
    resources :machines
    resources :places
      
  
    namespace :admin do
      resources :users
    end
  end
  
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :stores do
        resources :machines, only: [:index]
      end
        
    end
  end
  
end
