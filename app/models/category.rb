class Category < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_one :most_recent_article, -> do
        merge(Article.most_recent_by_category)
      end, class_name: "Article", inverse_of: :category
end