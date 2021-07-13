Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
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
  
  
  resources :stores, only: %i[new create edit update]
     
  resources :password_resets, only: %i[new create edit update]
  
  resources :contacts, only: %i[new create] do
    collection do
      post :confirm
    end
  end
  
  scope :manage do
    resources :answers, only: %i[new create] do
      collection do
        post :confirm
      end
    end
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
        
  
end
