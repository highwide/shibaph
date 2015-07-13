class PracticesController < ApplicationController
  permits :title, :unit

  def index
    # TODO: current_userから取得する
    @user = User.first
    @practices = @user.practices
  end

  def show
    @practice = Practice.find(params[:id])
    @display_dates = format_dates_by_term(4)
  end

  def new
    @practice = Practice.new
  end

  def create(practice)
    @practice = Practice.new(practice).tap { |p| p.user = current_user }
    @practice.daily_progresses.build(done_at: Time.zone.now)

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
def format_dates_by_term(month)
  end_date = Time.zone.now
  start_date = end_date.months_ago(month)
  date_per_week = []

  while (start_date <= end_date)
    if date_per_week.empty? || date_per_week.last.last.wday == 6
      date_per_week << [start_date]
    else
      date_per_week.last << start_date
    end
    start_date += 1.day
  end

  date_per_week
end
