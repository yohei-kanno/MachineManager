Rails.application.routes.draw do
  root to: "welcomes#new"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users do
    member do
      patch :add_admin
      patch :add_general
      get :activate
    end
  end
  
  resources :machines
  resources :places
  
  
  resources :stores, only: [:new, :create, :edit, :update] do
    namespace :admin do
      resources :users  do
        member do
          get :activate
        end
      end
    end
    collection do
      get :back
      post :back_create
    end
    
    
  end
          
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
        
  
end
