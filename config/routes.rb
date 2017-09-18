Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:index, :create, :new, :edit, :update] do
    resources :messages
  end
  resources :messages, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
end
