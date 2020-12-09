require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test 'should save valid movie' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink", summary: "This is the movie summary", actors: "Actors", video: "Video_link", restrictions: "16+")
    movie.save
    assert movie.valid?
  end

  test 'should not save movie without title' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", country: "country", release_date: Date.new(2020,11,12), poster: "posterLink", summary: "This is the movie summary")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without duration' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", country: "country", release_date: Date.new(2020,11,12), poster: "posterLink", summary: "This is the movie summary")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without genre' do
    movie = Movie.create(title:"movieTitle", director: "director", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink", summary: "This is the movie summary")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without release date' do
    movie = Movie.create(title:"movieTitle", director: "director", duration: 99, country: "country", genre: "genre", poster: "posterLink", summary: "This is the movie summary")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without summary' do
    movie = Movie.create(title:"movieTitle", director: "director", duration: 99, country: "country", genre: "genre", poster: "posterLink", release_date: Date.new(2020,11,12))
    movie.save
    refute movie.valid?
  end

  test 'should not save movie with the same title' do
    movie1 = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink", summary: "This is the movie summary")
    movie1.save
    assert movie1.valid?

    movie2 = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink", summary: "This is the movie summary")
    movie2.save
    refute movie2.valid?
  end

  test 'should not save movie without poster' do
    movie2 = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), summary: "This is the movie summary")
    movie2.save
    refute movie2.valid?
  end

end
