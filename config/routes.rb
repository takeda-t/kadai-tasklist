Rails.application.routes.draw do
  root to: "tasks#index"
  
  get "login", to: "session#new"
  post "login", to: "session#create"
  delete "logout", to: "session#destroy"
  
  resources :tasks
  
  get "signup", to: "users#new"
  resources :users, only: [:new, :create]
end
