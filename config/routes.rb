Rails.application.routes.draw do
  root 'chat_rooms#index'
  resources :chat_messages
  devise_for :users
  resources :users, only: :index
  resources :chat_rooms
  mount ActionCable.server, at: '/cable'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
