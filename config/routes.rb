Rails.application.routes.draw do
  devise_for :user
  root 'groups#index'
  resources :users, only: [:uodate]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create]
  end
end

