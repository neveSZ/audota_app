Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :animals, only: %i[index show create new edit update]
  resources :orders, only: %i[create new index show]
  resources :favoritos, only: %i[create index]
  delete 'favoritos(.:format)', to: 'favoritos#destroy'
  get '/admin', to: 'admin#index'
  post '/orders/:id', to: 'orders#concluir', as: 'concluir_order'
  delete '/orders/:id', to: 'orders#cancelar', as: 'cancelar_order'
end
