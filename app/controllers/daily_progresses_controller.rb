class DailyProgressesController < ApplicationController
  def show
    end_date = Time.zone.now
    start_date = end_date.months_ago(3)
    @date_per_week = []

    while (start_date <= end_date)
      if date_per_week.empty? || date_per_week.last.last.wday == 6
        @date_per_week << [start_date]
      else
        @date_per_week.last << start_date
      end
      start_date += 1.day
    end
    
  end
end
