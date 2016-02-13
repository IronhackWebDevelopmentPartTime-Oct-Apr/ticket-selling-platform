Rails.application.routes.draw do
  root to: "events#index"

  get 'users/superuser', to: "users#superuser"

  resources :events
  resources :venues
  resources :performers

  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'profile', to: 'users#profile'   
  resources :users

end
