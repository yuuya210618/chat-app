Rails.application.routes.draw do
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }
  root to: "rooms#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :users, only: [:edit, :update]
 resources :rooms, only: [:new, :create, :destroy] do
  resources :messages, only: [:index, :create]
end
end
