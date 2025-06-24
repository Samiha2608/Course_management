class User < ApplicationRecord
  has_many :comments_written, as: :author, class_name: "Comment"
  has_many :course_enrollments, foreign_key: :student_id
  has_many :courses, through: :course_enrollments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone_no, presence: true, numericality: { only_integer: true }
  validates :address, presence: true

  scope :admins, -> { where(type: "Admin") }
  scope :students, -> { where(type: "Student") }

  before_validation :ensure_phone_no_range
  before_save :ensure_phone_no_range
  before_update :ensure_phone_no_range


  private
  def ensure_phone_no_range
    if phone_no.present? && (phone_no < 10000000000 || phone_no > 99999999999)
      errors.add(:phone_no, "must be a 11-digit number")
      throw :abort
    end
  end
end
