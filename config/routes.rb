Rails.application.routes.draw do

  resources :trips, only: [:show, :edit, :update, :destroy]

  resources :passengers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
