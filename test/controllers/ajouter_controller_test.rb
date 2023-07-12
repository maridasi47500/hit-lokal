require "test_helper"

class AjouterControllerTest < ActionDispatch::IntegrationTest
  test "should get clip" do
    get ajouter_clip_url
    assert_response :success
  end
end
