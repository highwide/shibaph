require 'test_helper'

class DailyProgressesControllerTest < ActionController::TestCase
  def setup
    session[:user_id] = User.first.id
    @practice = practices :oss
  end

  test 'should get new, when new practice' do
    get :new, practice_id: practices(:no_progress).id

    assert { assigns(:daily_progress).goal == 0 }
    assert_response 201
  end

  test 'should get new, when continuing progress' do
    practice = practices :no_today_progress
    yesterday_progress = daily_progresses :yesterday_progress

    get :new, practice_id: practice.id

    assert { assigns(:daily_progress).goal == yesterday_progress.progress }
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
