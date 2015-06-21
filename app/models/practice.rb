class Practice < ActiveRecord::Base
  belongs_to :user
  has_many   :daily_progresses
  validates  :user_id, presence: true
  validates  :title,   presence: true, length: { maximum: 50 }
  validates  :unit,    presence: true, length: { maximum: 10 }
end
