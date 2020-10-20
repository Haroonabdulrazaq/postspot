class User < ApplicationRecord
    has_many :articles
    has_many :votes
    validates_presence_of :name, :password
    validates_uniqueness_of :name
    has_secure_password
end
