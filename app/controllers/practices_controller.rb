class PracticesController < ApplicationController
  permits :title, :unit

  def index
    @practices = current_user.practices
  end

  def show
    @practice = Practice.find(params[:id])
    @end_date = Time.zone.now.to_date
    @start_date = @end_date.years_ago(1).to_date
    @range_progresses = RangeProgresses.new(params[:id], @start_date, @end_date)
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
