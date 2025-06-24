class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :author, polymorphic: true
  validates :content, presence: true, length: { in: 5..100 }
end
