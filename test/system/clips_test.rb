require "application_system_test_case"

class ClipsTest < ApplicationSystemTestCase
  setup do
    @clip = clips(:one)
  end

  test "visiting the index" do
    visit clips_url
    assert_selector "h1", text: "Clips"
  end

  test "should create clip" do
    visit clips_url
    click_on "New clip"

    fill_in "Cat", with: @clip.cat_id
    fill_in "Email", with: @clip.email
    fill_in "Link", with: @clip.link
    fill_in "Region", with: @clip.region
    check "Video" if @clip.video
    click_on "Create Clip"

    assert_text "Clip was successfully created"
    click_on "Back"
  end

  test "should update Clip" do
    visit clip_url(@clip)
    click_on "Edit this clip", match: :first

    fill_in "Cat", with: @clip.cat_id
    fill_in "Email", with: @clip.email
    fill_in "Link", with: @clip.link
    fill_in "Region", with: @clip.region
    check "Video" if @clip.video
    click_on "Update Clip"

    assert_text "Clip was successfully updated"
    click_on "Back"
  end

  test "should destroy Clip" do
    visit clip_url(@clip)
    click_on "Destroy this clip", match: :first

    assert_text "Clip was successfully destroyed"
  end
end
