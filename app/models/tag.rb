class Tag < ApplicationRecord
  has_many :course_taggings
  has_many :courses, through: :course_taggings
  validates :name, presence: true
  before_validation :ensure_name_is_titleized
  before_save :ensure_name_is_titleized
  before_update :ensure_name_is_titleized

  private
  def ensure_name_is_titleized
    self.name = name.titleize if name.present?
  end
end
