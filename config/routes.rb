Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "groups#index"

  resources :group_operacions
  resources :operations
  resources :groups
  resources :users
  
end
