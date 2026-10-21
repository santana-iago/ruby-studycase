Rails.application.routes.draw do
  resources :pedidos, only: [:index, :create]
end
