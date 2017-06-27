Rails.application.routes.draw do
  root 'messages#index'
  resources :messages, only: [:new , :create]
end
