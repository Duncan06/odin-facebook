Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show]

  resources :friends, only: [:create, :update, :destroy]

  resources :posts do
    resources :comments, module: :posts
    resources :likes, only: [:create, :destroy]
  end

  resources :comments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
