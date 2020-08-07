Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: :order do
    post 'order', on: :member
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end
