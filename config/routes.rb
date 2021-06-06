Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :animals, only: %i[index show]
  resources :orders, only: %i[create new]
end
