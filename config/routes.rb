Rails.application.routes.draw do
  get 'sessions/new'
  root to: "sessions#new"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :stores, only: [:new, :create] do
    resources :users
  
    namespace :admin do
      resources :users
    end
  end
  
end
