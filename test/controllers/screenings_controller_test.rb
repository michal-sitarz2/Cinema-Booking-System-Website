require 'test_helper'

class ScreeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screening = screenings(:one)
    @movie = movies(:one)
    @cinema = cinemas(:one)
  end

  test "should get index" do
    get screenings_url
    assert_response :success
  end

  test "should get new" do
    get new_screening_url
    assert_response :success
  end

  test "should create screening" do
    assert_difference('Screening.count') do
      post screenings_url, params: { screening: { arena: @screening.arena, movie_id: @movie.id, cinema: @screening.cinema, available_seats: @screening.available_seats, price: @screening.price, screening_date: @screening.screening_date, screening_time: @screening.screening_time } }
    end
    assert_redirected_to "/allresources"
  end

  test "should show screening" do
    get screening_url(@screening)
    assert_response :success
  end

  test "should get edit" do
    get edit_screening_url(@screening)
    assert_response :success
  end

  test "should update screening" do
    patch screening_url(@screening), params: { screening: { arena: @screening.arena, movie_id: @movie.id, cinema: @screening.cinema, available_seats: @screening.available_seats, price: @screening.price, screening_date: @screening.screening_date, screening_time: @screening.screening_time } }
    assert_redirected_to "/allresources"
  end

  test "should destroy screening" do
    assert_difference('Screening.count', -1) do
      delete screening_url(@screening)
    end

    assert_redirected_to "/allresources"
  end
end
