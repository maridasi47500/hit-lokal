require "test_helper"

class RealisateursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get realisateurs_index_url
    assert_response :success
  end
end
