Rails.application.routes.draw do
  devise_for :user
  root 'groups#index'
  resources :users, only: [:index, :uodate]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
end

