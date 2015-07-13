require 'test_helper'

class PracticesControllerTest < ActionController::TestCase
  def setup
    user = User.create(
      provider: 'twitter',
      name: 'John',
      uid: '1',
      image: 'https://abs.twimg.com/sticky/default_profile_images/default_profile_2.png'
    )
    session[:user_id] = user.id
  end
  test "sohuld post create" do
    post :create, practice: {title: 'running', unit: 'km'}

    assert_redirected_to root_path

    practice = Practice.find_by(title: 'running', unit: 'km')
    assert { practice.title == 'running' }
    assert { practice.unit == 'km' }
    assert { practice.daily_progresses.count == 1 }
  end
end
