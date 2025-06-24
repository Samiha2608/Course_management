class CourseEnrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student, class_name: "Student"
  # scope :admins, -> { where(type: "Admin") }
  scope :existing_enrollments, ->(student, course_ids) {
    where(student: student, course_id: course_ids)
  }
  # course_unregister = CourseEnrollment.find_by(student: @student, course_id: params[:course_id])
  scope :course_unregister, ->(student, course_id) {
    find_by(student: student, course_id: course_id)
  }
end
