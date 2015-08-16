class PracticesController < ApplicationController
  permits :title, :unit

  def index
    @practices = current_user.practices
  end

  def show
    display_months = 12
    @practice = Practice.find(params[:id])
    progresses = @practice.daily_progresses.in_this_months(display_months)
    @progresses = format(progresses, display_months)
  end

  def new
    @practice = Practice.new
  end

  def create(practice)
    @practice = Practice.new(practice).tap { |p| p.user = current_user }
    if @practice.save
      redirect_to :root, notice: '習慣を登録しました'
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end
end

private

def format(progresses, months)
  end_date = Time.zone.now
  start_date = end_date.months_ago(months)
  date_per_week = []

  while (start_date <= end_date)
    if date_per_week.empty? || date_per_week.last.any? {|k, _| k.wday == 6}
      date_per_week << \
          {start_date => progresses.select{|p| p.done_at == start_date.to_date}.last}
    else
      date_per_week.last[start_date] = progresses.select{|p| p.done_at == start_date.to_date}.last
    end
    start_date += 1.day
  end
  date_per_week
end
