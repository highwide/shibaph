module PracticeHelper
  def color(daily)
    if daily.blank? || daily.progress == 0
      '#eee'
    else
      progress_rate = daily.progress.to_f / daily.goal.to_f
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
end
