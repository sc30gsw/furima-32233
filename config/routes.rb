Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  resources :purchase_infos, only: [:new, :create]
end
