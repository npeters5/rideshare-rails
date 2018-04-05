Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcomes, only: [:index]

  resources :drivers

  put '/trips/:id', to: 'trips#update_rating'

  resources :trips, only: [:show, :edit, :update, :destroy]

  resources :passengers do
    resources :trips, only: [:create]
  end


end
