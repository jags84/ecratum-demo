Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :users, only: [:new,:create]
  resources :chat_rooms, only: [:show]
  root to: 'users#new'
end
