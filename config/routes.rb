Rails.application.routes.draw do
  root 'top#index'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :practices
end
