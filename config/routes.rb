# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  root to: 'animals#index'
  resources :animals, only: %i[index show create new edit update], path: 'animais',
                      path_names: { new: 'novo', edit: 'editar' }
  resources :orders, only: %i[create new index show], path: 'pedidos', path_names: { new: 'novo' }
  resources :favorites, only: %i[create index], path: 'favoritos'
  delete 'favoritos(.:format)', to: 'favorites#destroy'
  get '/admin', to: 'admin#index'
  post '/pedidos/:id', to: 'orders#conclude', as: 'conclude_order'
  delete '/pedidos/:id', to: 'orders#cancel', as: 'cancel_order'
  delete 'animais/delete_media/:id', to: 'animals#delete_media_attachment', as: 'delete_media_attachment'
end
