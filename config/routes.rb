Rails.application.routes.draw do
  resources :chat_messages
  devise_for :users
  resources :chat_rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
