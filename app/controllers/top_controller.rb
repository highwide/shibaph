class TopController < ApplicationController
  def index
    redirect_to practices_path if logged_in?
  end
end
