Rails.application.routes.draw do
  devise_for :users

  root to: 'movies#index'

  resources :users do
    resource :movies, only: [:new, :create, :edit, :update]
  end
  resources :movies, only: [:index, :show]
end
