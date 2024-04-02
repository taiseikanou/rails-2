Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#top'
  get 'users/account'
  get 'users/profile'
  get 'users/profile/edit', to:'users#profile_edit'
  patch 'users/profile/edit', to: 'users#profile_update'
  get 'rooms/own'
  resources :reservations
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

