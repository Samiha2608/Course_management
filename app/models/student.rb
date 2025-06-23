# app/models/student.rb
class Student < User
  has_many :comments, as: :commentable, dependent: :destroy
end
