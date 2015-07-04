# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string`           |
# **`provider`**    | `string`           |
# **`uid`**         | `string`           |
# **`image`**       | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#

class User < ActiveRecord::Base
  has_many :practices
  validates :name,     presence: true
  validates :provider, presence: true
  validates :uid,      presence: true, uniqueness: true
  validates :image,    presence: true, uniqueness: true

  def self.find_or_create_from_auth_hash(auth)
    User.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.name = auth[:info][:nickname]
      user.image = auth[:info][:image]
    end
  end
end
