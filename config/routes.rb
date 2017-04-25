Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :users, only: [:new,:create,:destroy]
  resources :chat_rooms, only: [:show]
  root to: 'users#new'
end
