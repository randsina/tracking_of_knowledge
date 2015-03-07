class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.save
    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  end

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.email = "user#{rand(36**50).to_s(36)}@bazinga.com" # Twitter doesn't provide user's email. I may generate fake email
    @user.save
    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
  end

  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.save
    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
