Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  
  resources :photos, only: [:index, :show, :create, :destroy]  
  resources :albums, except: [:index] do
    member do
      post 'photo/:photo', to: 'albums#add', as: 'add_photo'
      delete 'photo/:photo', to: 'albums#delete', as: 'del_photo'
    end
  end
  resources :slide_shows, except: [:index] do    # i haven't time making that is normal
    member do
      post 'photo/:photo', to: 'slide_shows#add', as: 'add_photo'
      delete 'photo/:photo', to: 'slide_shows#delete', as: 'del_photo'
    end
  end
  resources :album_photo_settings, only: [:show]
  resources :profile, only: [:show]
  resources :comments, only: [:create, :destroy]
  resources :collections, only: [:create, :update, :destroy]
  resources :votes, only: [:create, :destroy]

  get '/index', to: 'profile#index', as: :index
  post 'search', to: 'search#search', as: :search
end
