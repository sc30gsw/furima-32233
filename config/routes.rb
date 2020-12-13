Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :purchase_infos, only: [:index, :create]
  end
end
