Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new"
    end
  end

  resources :users

  resources :friends, only: [:create, :update, :destroy]

  resources :posts do
    resources :comments, module: :posts
    resources :likes, only: [:create, :destroy]
  end

  resources :comments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
