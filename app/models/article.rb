class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :votes, dependent: :destroy
  has_one_attached :image
  belongs_to :category, class_name: 'Category', foreign_key: :category_id
end
