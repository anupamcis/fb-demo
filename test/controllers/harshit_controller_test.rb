require "test_helper"

class HarshitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get harshit_index_url
    assert_response :success
  end
end
