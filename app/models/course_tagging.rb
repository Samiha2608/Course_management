class CourseTagging < ApplicationRecord
  belongs_to :course
  belongs_to :tag
end
