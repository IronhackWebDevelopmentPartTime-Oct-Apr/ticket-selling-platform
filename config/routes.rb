Rails.application.routes.draw do
  root to: "events#index"



  resources :events
  resources :venues
  resources :performers
  resources :memberships

  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'profile', to: 'users#profile'   
  resources :users

end
