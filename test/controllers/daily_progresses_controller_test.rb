require 'test_helper'

class DailyProgressesControllerTest < ActionController::TestCase
  def setup
    session[:user_id] = User.first.id
    @practice = practices :oss
  end

  test 'should get new' do
    yesterday_progress = daily_progresses :yeesterday_oss_progress

    get :new, daily_progress: { practice_id: @practice.id }

    assert { assigns(:daily_progress).goal.eq yesterday_progress.progress }
    assert_response 201
  end

  test 'should post create valid' do
    post :create, daily_progress: { practice_id: @practice.id, progress: 5, goal: 1 }

    assert_response 201
  end

  test 'should post create invalid' do
    post :create, daily_progress: { practice_id: @practice.id, progress: 'a', goal: 1 }

    assert_response 422
  end
end
