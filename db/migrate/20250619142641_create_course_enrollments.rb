class CreateCourseEnrollments < ActiveRecord::Migration[7.2]
  def change
    create_table :course_enrollments do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
