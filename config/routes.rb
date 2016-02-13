Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#profile' 
  root to: 'users#profile' #esto es para que la página
  #principal sea el profile
  resources :users
end  