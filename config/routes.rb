Rails.application.routes.draw do
  resources :postings
  resources :users

  root 'postings#index'
end
