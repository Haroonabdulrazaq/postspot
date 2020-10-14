class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  scope :popular, -> {
select('article_id, count(article_id)
as count').group(:article_id).order('count desc').limit(1)
} 
end
