Rails.application.routes.draw do
  resources :deliveries, only: [:create]
  mount ActionCable.server => '/cable'
end
