Rails.application.routes.draw do
  root 'messages#index'
  devise_for :user
  resources :messages, only: [:new , :create]
end
