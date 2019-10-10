require "application_system_test_case"

class TwitsTest < ApplicationSystemTestCase
  setup do
    @twit = twits(:one)
  end

  test "visiting the index" do
    visit twits_url
    assert_selector "h1", text: "Twits"
  end

  test "creating a Twit" do
    visit twits_url
    click_on "New Twit"

    fill_in "Message", with: @twit.message
    fill_in "User", with: @twit.user_id
    click_on "Create Twit"

    assert_text "Twit was successfully created"
    click_on "Back"
  end

  test "updating a Twit" do
    visit twits_url
    click_on "Edit", match: :first

    fill_in "Message", with: @twit.message
    fill_in "User", with: @twit.user_id
    click_on "Update Twit"

    assert_text "Twit was successfully updated"
    click_on "Back"
  end

  test "destroying a Twit" do
    visit twits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twit was successfully destroyed"
  end
end
