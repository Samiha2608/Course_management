# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_19_142652) do
  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "course_enrollments", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_enrollments_on_course_id"
    t.index ["student_id"], name: "index_course_enrollments_on_student_id"
  end

  create_table "course_taggings", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_taggings_on_course_id"
    t.index ["tag_id"], name: "index_course_taggings_on_tag_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.integer "course_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "course_id", null: false
    t.index ["course_id", "student_id"], name: "index_courses_students_on_course_id_and_student_id"
    t.index ["student_id", "course_id"], name: "index_courses_students_on_student_id_and_course_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "email"
    t.integer "phone_no"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_enrollments", "courses"
  add_foreign_key "course_enrollments", "users", column: "student_id"
  add_foreign_key "course_taggings", "courses"
  add_foreign_key "course_taggings", "tags"
end
