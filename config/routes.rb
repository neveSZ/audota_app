Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :animals, only: %i[index show]
  resources :orders, only: %i[create new]
  resources :favoritos, only: %i[create index]
  delete 'favoritos(.:format)', to: 'favoritos#destroy'
  scope :admin, as: 'admin' do
    get '/', to: 'admin#index'
    resources :animals, only: %i[create new edit show index]
    resources :orders, only: %i[index show]
    post '/orders/:id', to: 'orders#concluir', as: 'concluir_order'
    delete '/orders/:id', to: 'orders#cancelar', as: 'cancelar_order'
  end
end
