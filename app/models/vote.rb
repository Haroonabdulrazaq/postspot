class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  scope :popular, lambda {
                    select('article_id, count(article_id)
as count').group(:article_id).order('count desc').limit(1)
                  }
end
