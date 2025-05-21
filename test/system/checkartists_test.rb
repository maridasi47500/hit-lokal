require "application_system_test_case"

class CheckartistsTest < ApplicationSystemTestCase
  setup do
    @checkartist = checkartists(:one)
  end

  test "visiting the index" do
    visit checkartists_url
    assert_selector "h1", text: "Checkartists"
  end

  test "should create checkartist" do
    visit checkartists_url
    click_on "New checkartist"

    fill_in "Country", with: @checkartist.country
    fill_in "Isartist", with: @checkartist.isArtist
    fill_in "Name", with: @checkartist.name
    click_on "Create Checkartist"

    assert_text "Checkartist was successfully created"
    click_on "Back"
  end

  test "should update Checkartist" do
    visit checkartist_url(@checkartist)
    click_on "Edit this checkartist", match: :first

    fill_in "Country", with: @checkartist.country
    fill_in "Isartist", with: @checkartist.isArtist
    fill_in "Name", with: @checkartist.name
    click_on "Update Checkartist"

    assert_text "Checkartist was successfully updated"
    click_on "Back"
  end

  test "should destroy Checkartist" do
    visit checkartist_url(@checkartist)
    click_on "Destroy this checkartist", match: :first

    assert_text "Checkartist was successfully destroyed"
  end
end
