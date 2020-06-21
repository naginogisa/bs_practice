Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'books#new'
  resources :books

resources :users, only: [:show, :edit, :update, :index]
get 'home/about' => 'users#new'
end
