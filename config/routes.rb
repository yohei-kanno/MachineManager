Rails.application.routes.draw do
  root to: "stores#new"
  resources :stores, only: [:new, :create]
end
