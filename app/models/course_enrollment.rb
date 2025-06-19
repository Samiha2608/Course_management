class CourseEnrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student, class_name: "User"
end
