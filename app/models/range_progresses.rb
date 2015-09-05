class RangeProgresses
  def initialize(id, start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    @progresses = DailyProgress.where(practice_id: id, done_at: start_date..end_date)
    @done_dates = @progresses.where('progress > 0').pluck(:done_at).sort
  end

  def format_each_week
    (@start_date..@end_date).each_with_object([]) do |date, formated_dates|
      if formated_dates.blank? || formated_dates[-1].last.wday == 6
        formated_dates << [date]
      else
        formated_dates[-1] << date
      end
    end
  end

  def total_done
    @done_dates.count
  end

  def longest_streak
    return @longest if defined? @longest

    dates_by_continuity = \
      @done_dates.each_with_object([]) do |date, dates_by_continuity|
        if dates_by_continuity.blank? || dates_by_continuity.last.last + 1.day != date
          dates_by_continuity << [date]
        else
          dates_by_continuity.last << date
        end
      end
    longest = dates_by_continuity.max_by{|dates| dates.count}
    @longest = {
      days: longest.count,
      start_date: longest[0],
      end_date: longest[-1]
    }
  end

  def current_streak
    return @current if defined? @current

    dates_from_current = @done_dates.reverse
    # FIXME: DuplicateMethodCall dates_from_current[0]
    if dates_from_current[0] == Time.zone.today
      streak = 1
      start_date = dates_from_current[0]
      while dates_from_current[0] - 1.day == dates_from_current[1]
        dates_from_current = dates_from_current.drop(1)
        start_date = dates_from_current[0]
        streak += 1
      end
    else
      streak, start_date = 0, 'now!'
    end
    @current = {
      days: streak,
      start_date: start_date
    }
  end

  def progress_rate(date)
    daily = @progresses.to_a.select{|daily| daily.done_at == date}.first
    return 0 if daily.blank?
    daily.progress.to_f / daily.goal.to_f
  end
end
