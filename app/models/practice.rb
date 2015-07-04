# ## Schema Information
#
# Table name: `practices`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`user_id`**     | `integer`          |
# **`title`**       | `string`           |
# **`unit`**        | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#

class Practice < ActiveRecord::Base
  belongs_to :user
  has_many   :daily_progresses
  validates  :user_id, presence: true
  validates  :title,   presence: true, length: { maximum: 50 }
  validates  :unit,    presence: true, length: { maximum: 10 }
end
