require "test_helper"

class CompositeursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get compositeurs_index_url
    assert_response :success
  end
end
