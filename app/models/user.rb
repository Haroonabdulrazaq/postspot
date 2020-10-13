class User < ApplicationRecord
    has_many :Articles
    has_many :Votes
end
