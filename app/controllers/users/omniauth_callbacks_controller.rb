# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  layout false

  before_action :initialize_user_from_auth_email, except: [ :failure ]

  def initialize_user_from_auth_email
    @user = User.from_omniauth_email(auth_hash)

    @user.confirm unless @user.confirmed?

    user_omniauth_providers

    if @user.persisted?
      sign_in_and_redirect @user
    else
      raise "Users::OmniauthCallbacksController: User not persisted"
    end
  end

  def user_omniauth_providers
    provider = auth_hash["provider"]
    if @user.omniauth_providers[provider].nil?
      @user.omniauth_providers[provider] = {
        "uid": auth_hash[:uid],
        "info": auth_hash[:info]
      }
    end

    @user.save
  end



  def google_oauth2; end

  def facebook; end

  def microsoft_graph; end

  def failure
    super
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
