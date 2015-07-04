require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create, provider: 'developer'
    assert_redirected_to root_path
  end

  test "should post create" do
    post :create, provider: 'developer'
    assert_redirected_to root_path
  end
end
