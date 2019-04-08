Rails.application.routes.draw do
  resources :duplicates, only: [:index, :create]
end
