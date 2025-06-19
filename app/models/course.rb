class Course < ApplicationRecord
  has_many :course_enrollments
  has_many :students, through: :course_enrollments, source: :student
  has_many :course_taggings
  has_many :tags, through: :course_taggings
  has_many :comments, as: :commentable
end
