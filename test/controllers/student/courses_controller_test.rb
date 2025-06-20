require "test_helper"

class Student::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get student_courses_show_url
    assert_response :success
  end
end
