Rails.application.routes.draw do
  resources :technologies do
    resources :themes
  end

  resources :surveys, only: [:index, :new, :create, :edit, :show, :update]
  resources :attempts, only: [:new, :create, :show]

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations' }
  resources :users
  root to: 'technologies#index'
end
