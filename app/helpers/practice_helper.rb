module PracticeHelper
  # TODO: 使ってみて緑の濃さ調整する
  def color(progress_rate)
    if progress_rate > 1
      '#1e6823'
    elsif progress_rate == 1
      '#44a340'
    elsif progress_rate > 0.5
      '#8cc665'
    elsif progress_rate > 0
      '#d6e685'
    else
      '#eee'
    end
  end
end
