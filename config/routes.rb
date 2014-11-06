Rails.application.routes.draw do
  root 'home#index'
  
  resources :photos, only: [:index, :show, :create, :destroy]
  
  resources :albums

  devise_for :users
end
