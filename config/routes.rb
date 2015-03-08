Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations' }
end
