class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :course_hour

      t.timestamps
    end
  end
end
