# ## Schema Information
#
# Table name: `daily_progresses`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`practice_id`**  | `integer`          |
# **`done_at`**      | `date`             |
# **`goal`**         | `integer`          | `not null`
# **`progress`**     | `integer`          |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#

class DailyProgress < ActiveRecord::Base
  belongs_to :practice
  validates  :practice,    presence: true
  validates  :done_at,     presence: true
  validates  :progress,    numericality: true

  after_initialize :set_goal

  private
  def set_goal
    self.goal = DailyProgress.select(:progress).where(done_at: Time.zone.yesterday, practice_id: practice_id).pluck(:progress).first || 0
  end
end
