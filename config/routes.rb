Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
  resources :groups, only: [:create, :new, :edit] do
    resources :messages
  end
end
