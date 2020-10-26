class Comment < ApplicationRecord
  belongs_to :article
  validates_presence_of :body, length: { minimum: 3, maximum: 100 }
end
