Rails.application.routes.draw do

  resources :drivers

  resources :trips, only: [:show, :edit, :update, :destroy]

  resources :passengers

end
