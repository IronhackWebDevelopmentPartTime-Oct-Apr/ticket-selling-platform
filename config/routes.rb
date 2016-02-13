Rails.application.routes.draw do
  root to: "events#index"

  get 'users/access_form', to: "users#access_form"

  resources :events
  resources :venues
  resources :performers

  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'profile', to: 'users#profile'   
  resources :users

end
