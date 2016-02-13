Rails.application.routes.draw do
  root to: "events#index"

  resources :events
  resources :venues
  resources :performers

  devise_for :users
  get 'profile', to: 'users#profile'   
  resources :users

end
