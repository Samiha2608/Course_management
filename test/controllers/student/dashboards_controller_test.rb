require "test_helper"

class Student::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboards" do
    get student_dashboards_dashboards_url
    assert_response :success
  end
end
