class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :course_taggings
  has_many :courses, through: :course_taggings
end
