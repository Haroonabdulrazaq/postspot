class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :votes, dependent: :destroy
  has_one_attached :image
end
