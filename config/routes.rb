Rails.application.routes.draw do
  resources :postings
  resources :users

  # Users
  get "signup" => "users#new", as: "new_signup"
  post "signup" => "users#create"
  resources :users, only: [:edit, :update]
  resources :password_resets, except: [:destroy]

  # Sessions
  get "signin" => "sessions#new", as: "new_session"
  post "signin" => "sessions#create", as: "session"
  delete "signout" => "sessions#destroy", as: "signout"

  root 'postings#index'
end
