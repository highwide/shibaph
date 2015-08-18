require 'test_helper'

class PracticesControllerTest < ActionController::TestCase
  def setup
    session[:user_id] = User.first.id
  end

  test "should post create" do
    post :create, practice: { title: 'running', unit: 'km' }

    assert_redirected_to root_path

    practice = Practice.find_by(title: 'running', unit: 'km')
    assert { practice.title == 'running' }
    assert { practice.unit == 'km' }
  end

  test "should post create, but failed" do
    post :create, practice: { title: 'running', unit: nil }

    assert_template :new

    assert_nil Practice.find_by(title: 'running')
  end
end
