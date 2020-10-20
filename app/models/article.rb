class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :votes, dependent: :destroy
  has_one_attached :image
  belongs_to :category, class_name: 'Category', foreign_key: :category_id
  validates :title, :text, :image, :category_id, presence: true

  scope :most_recent_by_category, lambda {
    from(
      <<~SQL
        (
          SELECT articles.*
          FROM articles JOIN (
             SELECT category_id, max(created_at) AS created_at
             FROM articles
             GROUP BY category_id
          ) latest_by_category
          ON articles.created_at = latest_by_category.created_at
          AND articles.category_id = latest_by_category.category_id
        ) articles
      SQL
    )
  }
end
