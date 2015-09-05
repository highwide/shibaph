require 'test_helper'

class RangeProgressesTest < ActiveSupport::TestCase
  def setup
    start_date = '2015-09-05'.to_date # 土曜日
    end_date = start_date + 2.days
    @range_progresses = RangeProgresses.new(1, start_date, end_date)
  end

  test 'format_each_week' do
    result = @range_progresses.format_each_week
    assert { result == [['2015-09-05'.to_date], ['2015-09-06'.to_date, '2015-09-07'.to_date]] }
  end
end
