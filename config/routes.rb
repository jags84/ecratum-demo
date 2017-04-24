Rails.application.routes.draw do
  get 'chat_rooms/index'

  resources :users
  resources :chat_rooms, only: [:show]
  root to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
