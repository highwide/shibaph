class ChengeColumnToDailyProgress < ActiveRecord::Migration
  def change
    change_column(:daily_progresses, :goal, :integer, null:false)
  end
end
