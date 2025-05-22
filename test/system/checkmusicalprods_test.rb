require "application_system_test_case"

class CheckmusicalprodsTest < ApplicationSystemTestCase
  setup do
    @checkmusicalprod = checkmusicalprods(:one)
  end

  test "visiting the index" do
    visit checkmusicalprods_url
    assert_selector "h1", text: "Checkmusicalprods"
  end

  test "should create checkmusicalprod" do
    visit checkmusicalprods_url
    click_on "New checkmusicalprod"

    fill_in "Country", with: @checkmusicalprod.country
    fill_in "Ismusicalprod", with: @checkmusicalprod.isMusicalprod
    fill_in "Name", with: @checkmusicalprod.name
    click_on "Create Checkmusicalprod"

    assert_text "Checkmusicalprod was successfully created"
    click_on "Back"
  end

  test "should update Checkmusicalprod" do
    visit checkmusicalprod_url(@checkmusicalprod)
    click_on "Edit this checkmusicalprod", match: :first

    fill_in "Country", with: @checkmusicalprod.country
    fill_in "Ismusicalprod", with: @checkmusicalprod.isMusicalprod
    fill_in "Name", with: @checkmusicalprod.name
    click_on "Update Checkmusicalprod"

    assert_text "Checkmusicalprod was successfully updated"
    click_on "Back"
  end

  test "should destroy Checkmusicalprod" do
    visit checkmusicalprod_url(@checkmusicalprod)
    click_on "Destroy this checkmusicalprod", match: :first

    assert_text "Checkmusicalprod was successfully destroyed"
  end
end
