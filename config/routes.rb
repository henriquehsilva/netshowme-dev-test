Rails.application.routes.draw do
  devise_for :users

  root to: 'movies#index'

  resources :users do
    resource :movies, only: %i(new create edit update destroy)
  end
  resources :movies, only: %i(index show)
end
