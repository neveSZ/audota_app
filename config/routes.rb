Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  get 'animals/search', to: 'animals#search'
  resources :animals, only: %i[index show]
  resources :orders, only: %i[create new]
  get 'favoritos/search', to: 'favoritos#search'
  resources :favoritos, only: %i[create index]
  delete 'favoritos(.:format)', to: 'favoritos#destroy'
end
