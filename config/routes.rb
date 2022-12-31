Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'
  resources :tasks
  # root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
