require "test_helper"

class Admin::FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_friend_index_url
    assert_response :success
  end
end
