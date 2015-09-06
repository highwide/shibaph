require 'test_helper'

class RangeProgressesTest < ActiveSupport::TestCase
  def setup
    start_date = '2015-08-21'.to_date
    end_date = Time.zone.today
    progress = daily_progresses :start_of_range_progresses
    @range_progresses = RangeProgresses.new(progress.practice.id, start_date, end_date)
  end

  # FIXME: 2016/8/22以降このテストはfailする
  test '#format_each_week' do
    result = @range_progresses.format_each_week
    expectation1 = [
      '2015-08-21'.to_date, # 金曜
      '2015-08-22'.to_date  # 土曜
    ]
    expectation2 = [
      '2015-08-23'.to_date,
      '2015-08-24'.to_date,
      '2015-08-25'.to_date,
      '2015-08-26'.to_date,
      '2015-08-27'.to_date,
      '2015-08-28'.to_date,
      '2015-08-29'.to_date
    ]
    assert { result.include? expectation1 }
    assert { result.include? expectation2 }
  end

  test '#total_done' do
    assert_equal 6, @range_progresses.total_done
  end

  test '#longest_streak' do
    result = @range_progresses.longest_streak
    expectation = {
      days: 3,
      start_date: '2015-08-23'.to_date,
      end_date: '2015-08-25'.to_date
    }
    assert { result == expectation }
  end

  test '#current_steak' do
    result = @range_progresses.current_streak
    expectation = {
      days: 2,
      start_date: Time.zone.yesterday
    }
    assert { result == expectation }
  end
end
