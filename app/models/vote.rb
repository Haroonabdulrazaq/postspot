class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  # scope :vote_num, ->{
  #   select('article_id, count(article_id)as count').group(:article_id).order('count desc')
  # }
end
