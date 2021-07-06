Rails.application.routes.draw do
  root to: "welcomes#new"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :stores, only: [:new, :create, :edit, :update] do
    collection do
      get :back
      post :back_create
    end
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
end
