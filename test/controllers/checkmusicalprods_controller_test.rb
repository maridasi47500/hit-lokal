require "test_helper"

class CheckmusicalprodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkmusicalprod = checkmusicalprods(:one)
  end

  test "should get index" do
    get checkmusicalprods_url
    assert_response :success
  end

  test "should get new" do
    get new_checkmusicalprod_url
    assert_response :success
  end

  test "should create checkmusicalprod" do
    assert_difference("Checkmusicalprod.count") do
      post checkmusicalprods_url, params: { checkmusicalprod: { country: @checkmusicalprod.country, isMusicalprod: @checkmusicalprod.isMusicalprod, name: @checkmusicalprod.name } }
    end

    assert_redirected_to checkmusicalprod_url(Checkmusicalprod.last)
  end

  test "should show checkmusicalprod" do
    get checkmusicalprod_url(@checkmusicalprod)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkmusicalprod_url(@checkmusicalprod)
    assert_response :success
  end

  test "should update checkmusicalprod" do
    patch checkmusicalprod_url(@checkmusicalprod), params: { checkmusicalprod: { country: @checkmusicalprod.country, isMusicalprod: @checkmusicalprod.isMusicalprod, name: @checkmusicalprod.name } }
    assert_redirected_to checkmusicalprod_url(@checkmusicalprod)
  end

  test "should destroy checkmusicalprod" do
    assert_difference("Checkmusicalprod.count", -1) do
      delete checkmusicalprod_url(@checkmusicalprod)
    end

    assert_redirected_to checkmusicalprods_url
  end
end
