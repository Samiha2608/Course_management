class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone_no, presence: true, numericality: { only_integer: true }
  validates :address, presence: true

  has_many :comments_written, as: :author, class_name: "Comment"

  # Add scope for different user types
  scope :admins, -> { where(type: "Admin") }
  scope :students, -> { where(type: nil) } # Regular users are students
end
