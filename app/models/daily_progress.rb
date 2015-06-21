class DailyProgress < ActiveRecord::Base
  belongs_to :practice
  validates  :practice_id, presence: true
  validates  :done_at,     presence: true
end
