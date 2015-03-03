class WelcomeController < ApplicationController
  def index
    puts request.env['omniauth.auth']
  end
end
