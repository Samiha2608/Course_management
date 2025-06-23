require "test_helper"

class Student::Courses::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get student_courses_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get student_courses_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get student_courses_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get student_courses_comments_destroy_url
    assert_response :success
  end
end
