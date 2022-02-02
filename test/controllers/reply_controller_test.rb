require "test_helper"

class ReplyControllerTest < ActionDispatch::IntegrationTest
  test "should get indexr" do
    get reply_indexr_url
    assert_response :success
  end
end
