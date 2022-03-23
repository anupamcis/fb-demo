require "test_helper"

class MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get indexm" do
    get message_indexm_url
    assert_response :success
  end
end
