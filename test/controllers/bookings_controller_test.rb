require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
    @user = users(:users_001)

    get '/users/sign_in'
    sign_in users(:users_001)
    post user_session_url
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post bookings_url, params: { booking: { arena: @booking.arena, booked_time: @booking.booked_time, booked_date: @booking.booked_date, cinema: @booking.cinema, movie_title: @booking.movie_title, quantity: @booking.quantity, total_price: @booking.total_price, user_id: @user.id } }
    end

    assert_redirected_to booking_url(Booking.last)
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end
end
