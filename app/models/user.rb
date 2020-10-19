class User < ApplicationRecord
    has_many :articles
    has_many :votes

    validates :name, presence: true
    has_secure_password
end
