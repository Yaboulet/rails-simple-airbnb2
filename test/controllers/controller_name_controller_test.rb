require "test_helper"

class ControllerNameControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get controller_name_create_url
    assert_response :success
  end

  test "should get update" do
    get controller_name_update_url
    assert_response :success
  end
end
