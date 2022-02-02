require "test_helper"

class FriendlistControllerTest < ActionDispatch::IntegrationTest
  test "should get indexf" do
    get friendlist_indexf_url
    assert_response :success
  end
end
