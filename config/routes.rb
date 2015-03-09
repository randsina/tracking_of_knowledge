Rails.application.routes.draw do
  resources :technologies#, only: [:index, :show]
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations' }
  resources :users
  root to: 'visitors#index'
end
