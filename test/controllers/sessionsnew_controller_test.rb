require 'test_helper'

class SessionsnewControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sessionsnew_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessionsnew_destroy_url
    assert_response :success
  end

end
