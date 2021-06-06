Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :animals, only: %i[index show]
  resources :orders, only: %i[create new]
  resources :favoritos, only: %i[create index]
  delete 'favoritos(.:format)', to: 'favoritos#destroy'
end
