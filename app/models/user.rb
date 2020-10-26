class User < ApplicationRecord
  has_many :articles
  has_many :votes
  validates_presence_of :name, length: { in: 3..20 }
  validates_presence_of :password, length: { in: 6..20 }
  validates_uniqueness_of :name
  has_secure_password
end
