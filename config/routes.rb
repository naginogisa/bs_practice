Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :edit, :update, :index]
  post 'follow/:id', to: 'relationships#create', as: 'follow'
  post 'unfollow/:id', to: 'relationships#destroy', as: 'unfollow'
  get 'users/following/:user_id', to: 'relationships#following', as:'users_following'
  get 'users/follower/:user_id', to: 'relationships#follower', as:'users_follower'
  

  
  get 'home/about' => 'users#new'
  root to: 'books#new'
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
