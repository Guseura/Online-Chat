Rails.application.routes.draw do
  resources :messages
  resources :room_messages
  devise_for :users
  root "dialogs#index"

  resources :dialogs
end
