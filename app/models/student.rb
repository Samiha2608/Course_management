class Student < User
  has_many :course_enrollments
  has_many :courses, through: :course_enrollments
  has_many :comments, as: :commentable
end
