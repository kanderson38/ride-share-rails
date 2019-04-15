Rails.application.routes.draw do
  root "drivers#index"

  resources :drivers
  resources :trips
  resources :passengers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end