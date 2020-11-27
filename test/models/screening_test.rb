require 'test_helper'

class ScreeningTest < ActiveSupport::TestCase

  setup do
    @movie = movies(:one)
    @cinema = cinemas(:one)
  end

  test 'should save valid screening' do
    screening = Screening.create(movie: @movie, cinema: @cinema, arena: "2C", price: 9.99, screening_time: Time.new(2020, 11, 30, 14, 40, 0), available_seats: 60)
    screening.save
    assert screening.valid?
  end

  test 'should not save screening without a movie' do
    screening = Screening.create(cinema: @cinema, arena: "2C", price: 9.99, screening_time: Time.new(2020, 11, 30, 14, 40, 0), available_seats: 60)
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without a cinema' do
    screening = Screening.create(movie: @movie, arena: "2C", price: 9.99, screening_time: Time.new(2020, 11, 30, 14, 40, 0), available_seats: 60)
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without an arena' do
    screening = Screening.create(movie: @movie, cinema: @cinema, price: 9.99, screening_time: Time.new(2020, 11, 30, 14, 40, 0), available_seats: 60)
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without a price' do
    screening = Screening.create(movie: @movie, cinema: @cinema, price: 9.99, screening_time: Time.new(2020, 11, 30, 14, 40, 0), available_seats: 60)
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without available seats' do
    screening = Screening.create(movie: @movie, cinema: @cinema, arena: "2C", price: 9.99, screening_time: Time.new(2020, 11, 30, 14, 40, 0))
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without screening time' do
    screening = Screening.create(movie: @movie, cinema: @cinema, arena: "2C", price: 9.99, available_seats: 60)
    screening.save
    refute screening.valid?
  end


end
