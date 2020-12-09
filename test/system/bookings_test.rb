require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "creating a Booking" do
    visit bookings_url
    click_on "New Booking"

    fill_in "Arena", with: @booking.arena
    fill_in "Booke time", with: @booking.booke_time
    fill_in "Booked date", with: @booking.booked_date
    fill_in "Cinema", with: @booking.cinema
    fill_in "Movie title", with: @booking.movie_title
    fill_in "Quantity", with: @booking.quantity
    fill_in "Total price", with: @booking.total_price
    fill_in "User", with: @booking.user_id
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "updating a Booking" do
    visit bookings_url
    click_on "Edit", match: :first

    fill_in "Arena", with: @booking.arena
    fill_in "Booke time", with: @booking.booke_time
    fill_in "Booked date", with: @booking.booked_date
    fill_in "Cinema", with: @booking.cinema
    fill_in "Movie title", with: @booking.movie_title
    fill_in "Quantity", with: @booking.quantity
    fill_in "Total price", with: @booking.total_price
    fill_in "User", with: @booking.user_id
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking" do
    visit bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end
