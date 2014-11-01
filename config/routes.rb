Rails.application.routes.draw do
  
  resources :albums

  root 'home#index'

  devise_for :users
end
