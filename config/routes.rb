Rails.application.routes.draw do
  root 'dashboard#index'

  get 'dashboard/index'
  namespace :api do
    resources :locations, only: [:index, :create]
  end
end
