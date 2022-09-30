require "test_helper"

class SceneriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sceneries_index_url
    assert_response :success
  end
end
