Rails.application.routes.draw do
  devise_for :user
  root 'groups#index'
  resources :groups, only: [:index, :new, :create, :edit, :update]
  resources :messages, only: [:index, :new, :create]
end
