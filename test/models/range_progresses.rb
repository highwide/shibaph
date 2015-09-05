require 'test_helper'

class RangeProgressesTest < ActiveSupport::TestCase
  def setup
    start_date = '2015-08-28'.to_date # 土曜日
    end_date = start_date + 2.days
    progress = daily_progresses :range_progress
    @range_progresses = RangeProgresses.new(progress.practice.id, start_date, end_date)
  end

  test '#format_each_week' do
    result = @range_progresses.format_each_week
    assert { result == [['2015-08-28'.to_date, '2015-08-29'.to_date], ['2015-08-30'.to_date]] }
  end

  test '#total_done' do
    assert_equal 1, @range_progresses.total_done
  end

  test '#longest_streak' do
    result = @range_progresses.longest_streak
    expectation = {
      days: 3,
      start_date: '2015-05-01'.to_date,
      end_date: '2015-05-03'.to_date
    }
    assert { result == expectation }
  end
end
