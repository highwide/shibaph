module ApplicationHelper
  def sign_in_url
    Twitter.login? ? 'auth/twitter' : '/auth/developer'
  end
end
