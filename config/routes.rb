Rails.application.routes.draw do
  resources :duplicates, only: [:index, :create]

  root 'duplicates#index'
end
