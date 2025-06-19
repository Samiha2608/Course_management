class CreateCourseTaggings < ActiveRecord::Migration[7.2]
  def change
    create_table :course_taggings do |t|
      t.references :course, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
