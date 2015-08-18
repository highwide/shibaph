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

  private

  #
  # Viewで表示するgraphのためにデータ構造を整形するメソッド
  # 日付をkey, DailyProgressモデルをvalueとするHashを作り、
  # 1週間ごと(土曜日(wdayが6)で切り替え)に別HashとしてArrayに詰め込んでいる
  #
  def format_for_graph_of_a_year(progresses)
    end_date = Time.zone.now.to_date
    start_date = end_date.years_ago(1).to_date
    (start_date..end_date).each_with_object([]) do |date, formated_dates|
      progress = progresses.find{|p| p.done_at == start_date}
      if formated_dates.empty? || formated_dates.last.any? {|k, _| k.wday == 6}
        formated_dates << {date => progress}
      else
        formated_dates.last[date] = progress
      end
    end
  end
end
