Rails.application.routes.draw do
  resource :home, only: [:show]

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations' }
  root to: 'visitors#index'
end
