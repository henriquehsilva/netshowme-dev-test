Rails.application.routes.draw do
  devise_for :users

  root to: 'movies#index'

  resources :users do
    resource :movies
  end
  get 'movies/index'
end
