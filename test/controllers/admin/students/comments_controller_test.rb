require "test_helper"

class Admin::Students::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_students_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_students_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_students_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_students_comments_destroy_url
    assert_response :success
  end
end
