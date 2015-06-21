class CreateDailyProgresses < ActiveRecord::Migration
  def change
    create_table :daily_progresses do |t|
      t.integer :practice_id
      t.date :done_at
      t.integer :goal
      t.integer :progress

      t.timestamps null: false
    end
  end
end
