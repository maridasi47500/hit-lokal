require "test_helper"

class CheckartistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkartist = checkartists(:one)
  end

  test "should get index" do
    get checkartists_url
    assert_response :success
  end

  test "should get new" do
    get new_checkartist_url
    assert_response :success
  end

  test "should create checkartist" do
    assert_difference("Checkartist.count") do
      post checkartists_url, params: { checkartist: { country: @checkartist.country, isArtist: @checkartist.isArtist, name: @checkartist.name } }
    end

    assert_redirected_to checkartist_url(Checkartist.last)
  end

  test "should show checkartist" do
    get checkartist_url(@checkartist)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkartist_url(@checkartist)
    assert_response :success
  end

  test "should update checkartist" do
    patch checkartist_url(@checkartist), params: { checkartist: { country: @checkartist.country, isArtist: @checkartist.isArtist, name: @checkartist.name } }
    assert_redirected_to checkartist_url(@checkartist)
  end

  test "should destroy checkartist" do
    assert_difference("Checkartist.count", -1) do
      delete checkartist_url(@checkartist)
    end

    assert_redirected_to checkartists_url
  end
end
