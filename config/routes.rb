require 'sidekiq/web'

Rails.application.routes.draw do
  get 'search' => 'search#index', as: 'search'

  mount Attachinary::Engine => "/attachinary"

  resources :listings do
    post :contact
  end

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

    # Super Admin
  constraints(AuthSuperAdmin) do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'listings#index'
end
