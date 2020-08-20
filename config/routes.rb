Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:inedx, :new, :create, :show] do
    resources :comments, only: :create
  end
  resources :users, only: [:index]
end
