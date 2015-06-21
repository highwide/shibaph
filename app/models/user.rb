class User < ActiveRecord::Base
  has_many  :practices 
  validates :name,     presence: true
  validates :provider, presence: true
  validates :uid,      presence: true, uniqueness: true
  validates :image,    presence: true, uniqueness: true
end
