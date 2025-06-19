class DropHabtmJoinTables < ActiveRecord::Migration[7.2]
  def change
    drop_table :students_courses, if_exists: true
    drop_table :courses_tags, if_exists: true
    drop_table :courses_users, if_exists: true
  end
end
