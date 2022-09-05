Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"

  resources :group_operacions
  resources :operations
  resources :groups
  resources :users
  resources :home
end
