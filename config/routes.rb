Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :users, only: [:show] do
    resources :ukuleles, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :ukuleles, only: [:index]
      resources :instrument_types, only: [:index]
      resources :ukulele_sizes, only: [:index]
      resources :ukulele_shapes, only: [:index]
    end
  end
end
