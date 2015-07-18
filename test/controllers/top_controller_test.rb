require 'test_helper'

class TopControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should redirect practices index if user logged in" do
    session[:user_id] = User.first.id
    get :index
    assert_redirected_to practices_path
  end
end
