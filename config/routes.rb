Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'
  root 'users#index'

  resources :users

  resources :friends, only: [:create, :update, :destroy]

  resources :posts do
    resources :comments, module: :posts
    resources :likes, only: [:create, :destroy]
  end

  resources :comments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
