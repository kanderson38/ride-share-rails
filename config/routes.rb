Rails.application.routes.draw do
  root "homepages#index"

  resources :drivers
  resources :trips
  resources :passengers do
    resources :trips, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
