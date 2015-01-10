Rails.application.routes.draw do
  get 'new/Albums'

  resource :users, only: [:new, :create]
  resource :user, only: [:show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy] do
    resources :notes, only: [:create]
  end
  
  resources :notes, only: [:destroy]

  root 'bands#index'
end
