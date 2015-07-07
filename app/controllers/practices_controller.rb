class PracticesController < ApplicationController
  def index
    @user = User.first
    @practices = @user.practices
  end

  def show
    @practice = Practice.find(params[:id])

    end_date = Time.zone.now
    start_date = end_date.months_ago(4)
    @date_per_week = []

    while (start_date <= end_date)
      if @date_per_week.empty? || @date_per_week.last.last.wday == 6
        @date_per_week << [start_date]
      else
        @date_per_week.last << start_date
      end
      start_date += 1.day
    end
  end

  def new
  end

  def create
  end
end
