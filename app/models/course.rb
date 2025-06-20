class Course < ApplicationRecord
  validates :course_name, presence: true
  validates :course_hour, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 500 }
  has_many :course_enrollments, dependent: :destroy
  has_many :students, through: :course_enrollments, source: :student, dependent: :destroy
  has_many :course_taggings, dependent: :destroy
  has_many :tags, through: :course_taggings, dependent: :destroy
  has_many :comments, as: :commentable
end
