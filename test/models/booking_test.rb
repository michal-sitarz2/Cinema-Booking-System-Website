require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  setup do
    @user = users(:users_001)
  end

  test 'should save valid booking' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: "20/12/2020", booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    assert booking.valid?
  end

  test 'should not save booking without user' do
    booking = Booking.create(movie_title: "Title", booked_date: "20/12/2020", booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without movie title' do
    booking = Booking.create(user_id: @user.id, booked_date: "20/12/2020", booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without date' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without time' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: "20/12/2020", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without quantity' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: "20/12/2020", booked_time: "15:30", cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without cinema' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: "20/12/2020", booked_time: "15:30", quantity: 3, arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without arena' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: "20/12/2020", booked_time: "15:30", quantity: 3, cinema: "Cinema", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without total price' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: "20/12/2020", booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21")
    booking.save
    refute booking.valid?
  end






end
