require 'test_helper'

class DailyProgressTest < ActiveSupport::TestCase
  test '#after_initialize, when practice has no progress' do
    practice = practices :no_progress
    assert { DailyProgress.new(practice_id: practice.id).goal == 0 }
  end

  test '#after_initialize, when practice has yesterday progress' do
    practice = practices :no_today_progress
    progress = daily_progresses :yesterday_progress
    assert { DailyProgress.new(practice_id: practice.id).goal == progress.progress }
  end
end
