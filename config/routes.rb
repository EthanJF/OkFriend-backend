Rails.application.routes.draw do
  resources :events
  resources :messages
  resources :chats
  resources :friendships
  resources :interests
  resources :users
  resources :login, only: [:create]

	mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
