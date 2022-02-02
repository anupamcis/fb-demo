require "test_helper"

class LikeControllerTest < ActionDispatch::IntegrationTest
  test "should get indexlike" do
    get like_indexlike_url
    assert_response :success
  end
end
