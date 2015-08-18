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

  scope :in_this_year, -> { where("done_at >= ?", Time.zone.now.years_ago(1)) }
end
