Rails.application.routes.draw do
  root 'home#index'
  
  resources :photos, only: [:index, :show, :create, :destroy]  
  resources :albums do
    member do
      post 'photo/:photo', to: 'albums#add', as: 'add_photo'
      delete 'photo/:photo', to: 'albums#delete', as: 'del_photo'
    end
  end

  devise_for :users
end
