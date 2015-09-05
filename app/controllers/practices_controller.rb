class PracticesController < ApplicationController
  permits :title, :unit

  def index
    @practices = current_user.practices
  end

  def show
    @practice = Practice.find(params[:id])
    progresses = @practice.daily_progresses.in_this_year
    @progresses = format_for_graph_of_a_year(progresses)
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
