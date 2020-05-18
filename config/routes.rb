Rails.application.routes.draw do
  get 'toppages/index'
  root to: "toppages#index"
  
  resources :tasks
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :new, :create, :show]
end
