Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show]
  resources :friends, only: [:create, :update, :destroy]
  resources :posts, shallow: true do
    resources :comments
    resources :likes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
