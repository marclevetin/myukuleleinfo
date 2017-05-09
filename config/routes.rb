Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  get 'home', to: 'static_pages#index'

  resources :users do
    resources :ukuleles
  end

  resources :videos, only: [:index, :new, :create]
  
  namespace :api do
    namespace :v1 do
      resources :ukuleles, only: [:index, :create]
      resources :users, only: [:index]
    end
  end


end
