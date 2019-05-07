Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events
  resources :users, only: [:show, :index, :edit, :update]

  root 'events#index'

end
