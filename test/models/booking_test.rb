require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  setup do
    @user = users(:users_001)
  end

  test 'should save valid booking' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    assert booking.valid?
  end

  test 'should not save booking without user' do
    booking = Booking.create(movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without movie title' do
    booking = Booking.create(user_id: @user.id, booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without date' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without time' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without quantity' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without cinema' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, arena: "21", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without arena' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", total_price: 15.0)
    booking.save
    refute booking.valid?
  end

  test 'should not save booking without total price' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21")
    booking.save
    refute booking.valid?
  end

  test 'should destroy if user destroyed' do
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    assert booking.valid?

    @user.destroy
    refute Booking.find_by(user_id: @user.id)

  end

  test 'should get booking based on users' do
    user2 = User.create(email: 'john@example.com', password: "123456")
    user2.save

    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: @user.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: user2.id, movie_title: "Title", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save

    assert Booking.find_user(@user.id).length() == 2

    booked_user = Booking.find_user(user2.id).first
    assert booked_user.user_id == user2.id
  end

  test 'should get the bookings history for a user' do
    user2 = User.create(email: 'john@example.com', password: "123456")
    user2.save

    booking = Booking.create(user_id: @user.id, movie_title: "Title1", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: @user.id, movie_title: "Title2", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: @user.id, movie_title: "Title3", booked_date: Date.new(2021, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: user2.id, movie_title: "Title4", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save

    bookings_history_for_user_1 = Booking.find_user(@user.id).booking_history
    assert bookings_history_for_user_1.length == 2
  end

  test 'should get the upcoming bookings for a user' do
    user2 = User.create(email: 'john@example.com', password: "123456")
    user2.save

    booking = Booking.create(user_id: @user.id, movie_title: "Title1", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: @user.id, movie_title: "Title2", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: @user.id, movie_title: "Title3", booked_date: Date.new(2021, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save
    booking = Booking.create(user_id: user2.id, movie_title: "Title4", booked_date: Date.new(2020, 12, 9), booked_time: "15:30", quantity: 3, cinema: "Cinema", arena: "21", total_price: 15.0)
    booking.save

    bookings_upcoming_for_user_1 = Booking.find_user(@user.id).booking_upcoming
    assert bookings_upcoming_for_user_1.length == 1
  end

end
