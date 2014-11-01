Rails.application.routes.draw do
  
  resources :photos

  resources :albums

  root 'home#index'

  devise_for :users
end
