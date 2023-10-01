require "test_helper"

class AssoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get asso_index_url
    assert_response :success
  end
end
