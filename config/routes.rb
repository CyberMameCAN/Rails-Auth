Rails.application.routes.draw do
  devise_for :users

  # get 'users/index'
  get 'users', to: 'users#index'
  get 'static_pages/home'
  get 'static_pages/help'

  resources :tasks

  root 'static_pages#home'
  root to: "tasks#index"

  # root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
