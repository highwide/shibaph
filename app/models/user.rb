class User < ActiveRecord::Base
  has_many  :practices
  validates :name,     presence: true
  validates :provider, presence: true
  validates :uid,      presence: true, uniqueness: true
  validates :image,    presence: true, uniqueness: true

  def self.find_or_create_from_auth_hash(auth)
    User.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.name  = auth[:info][:nickname]
      user.image = auth[:info][:image]
    end
  end
end
