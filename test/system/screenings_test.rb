require "application_system_test_case"

class ScreeningsTest < ApplicationSystemTestCase
  setup do
    @screening = screenings(:one)
  end

  test "visiting the index" do
    visit screenings_url
    assert_selector "h1", text: "Screenings"
  end

  test "creating a Screening" do
    visit screenings_url
    click_on "New Screening"

    fill_in "Arena", with: @screening.arena
    fill_in "Available seats", with: @screening.available_seats
    fill_in "Price", with: @screening.price
    fill_in "Screening date", with: @screening.screening_date
    fill_in "Screening time", with: @screening.screening_time
    click_on "Create Screening"

    assert_text "Screening was successfully created"
    click_on "Back"
  end

  test "updating a Screening" do
    visit screenings_url
    click_on "Edit", match: :first

    fill_in "Arena", with: @screening.arena
    fill_in "Available seats", with: @screening.available_seats
    fill_in "Price", with: @screening.price
    fill_in "Screening date", with: @screening.screening_date
    fill_in "Screening time", with: @screening.screening_time
    click_on "Update Screening"

    assert_text "Screening was successfully updated"
    click_on "Back"
  end

  test "destroying a Screening" do
    visit screenings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Screening was successfully destroyed"
  end
end
