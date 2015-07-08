module ApplicationHelper
  def sign_in_url
    Rails.env.production? ? 'auth/twitter' : '/auth/developer'
  end
end
