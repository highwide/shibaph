class SessionsController < ApplicationController
  before_action -> { request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter] } unless Rails.env.production?

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to :root
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
