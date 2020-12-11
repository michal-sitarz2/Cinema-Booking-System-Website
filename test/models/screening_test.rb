require 'test_helper'

class ScreeningTest < ActiveSupport::TestCase

  setup do
    @movie = movies(:two)
    @cinema = cinemas(:one)
  end

  test 'should save valid screening' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    assert screening.valid?
  end

  test 'should not save screening without an arena' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without a price' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without available seats' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without screening time' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without screening date' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, available_seats: 60, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without movie' do
    screening = Screening.create(cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save screening without cinema' do
    screening = Screening.create(movie_id: @movie[:id], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should get default value for screening type if not save' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60)
    screening.save
    screening_saved = Screening.find_by(id: screening.id)
    assert screening_saved.screening_type == "2D"
  end

  test 'should get default value for sold seats' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60)
    screening.save
    screening_saved = Screening.find_by(id: screening.id)
    assert screening_saved.sold_seats == 0
  end

  test 'should restrict deleteing if associated to line item' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save

    cart = carts(:one)
    item = LineItem.create(screening_id: screening.id, cart_id: cart.id)
    item.save

    refute screening.destroy
  end

  test 'should destroy the screening if movie destroyed' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/example", restrictions: "PG-13")
    movie.save

    screening = Screening.create(movie_id: movie.id, cinema: @cinema.name, arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60)
    screening.save

    assert Screening.find_by(id: screening.id)
    assert Movie.find_by(id: movie.id).destroy
    refute Screening.find_by(id: screening.id)
  end

  test 'should get screenings in the past' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,03), available_seats: 60, screening_type: "3D")
    screening.save
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2022,02,02), available_seats: 60, screening_type: "3D")
    screening.save

    assert Screening.screening_passed.length() == 4
  end

  test 'should get upcoming screening' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 60, screening_type: "3D")
    screening.save
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,03), available_seats: 60, screening_type: "3D")
    screening.save
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2022,02,02), available_seats: 60, screening_type: "3D")
    screening.save

    assert Screening.screening_upcoming.length() == 1
  end

  test 'available seats should be a positive integer' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 9.99, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: -1, screening_type: "3D")
    screening.save
    refute screening.valid?

    screening.available_seats = 123.12
    screening.save
    refute screening.valid?
  end

  test 'price should be a positive float' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: -15, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 30, screening_type: "3D")
    screening.save
    refute screening.valid?
  end

  test 'should not save a screening with invalid type' do
    screening = Screening.create(movie_id: @movie[:id], cinema: @cinema[:name], arena: "2C", price: 5, screening_time: Time.now, screening_date: Date.new(2020,02,02), available_seats: 30, screening_type: "5D")
    screening.save
    refute screening.valid?
  end

end
