require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
  end

  test 'find existed user' do
    auth = OmniAuth::AuthHash.new({
      provider: "twitter",
      uid: "123456",
      info: {
        nickname: "johnqpublic",
        image: "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
      }
    })
    user = User.find_or_create_from_auth_hash(auth)
    assert(user.id, @user.id)
    assert_equal(user.uid, auth[:uid])
  end

  test 'create new user' do
    auth = OmniAuth::AuthHash.new({
      provider: "twitter",
      uid: "123",
      info: {
        nickname: "johnqpublic",
        image: "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
      }
    })
    user = User.find_or_create_from_auth_hash(auth)
    assert_not_equal(user.id, @user.id)
    assert_equal(user.uid, auth[:uid])
  end
end
