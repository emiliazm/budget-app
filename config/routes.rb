Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"
  
  resources :groups do
    resources :operations
  end
  
  resources :home
end
