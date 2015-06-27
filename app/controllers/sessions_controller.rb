class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to :root
  end

  private
  def auth_hash
    Rails.env.production? ? request.env['omniauth.auth'] : OmniAuth.config.mock_auth[:twitter]
  end
end
