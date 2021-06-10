Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  root to: 'animals#index'
  resources :animals, only: %i[index show create new edit update], path: 'animais',
                      path_names: { new: 'novo', edit: 'editar' }
  resources :orders, only: %i[create new index show], path: 'pedidos', path_names: { new: 'novo' }
  resources :favoritos, only: %i[create index], path: 'favoritos'
  delete 'favoritos(.:format)', to: 'favoritos#destroy'
  get '/admin', to: 'admin#index'
  post '/orders/:id', to: 'orders#concluir', as: 'concluir_order'
  delete '/orders/:id', to: 'orders#cancelar', as: 'cancelar_order'
  delete 'animals/delete_midia/:id', to: 'animals#delete_midia_attachment', as: 'delete_midia_attachment'
end
