require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test 'should save valid movie' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "N/A")
    movie.save
    assert movie.valid?
  end

  test 'should not save movie without title' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without duration' do
    movie = Movie.create(title:"movieTitle", video: "https://www.youtube.com/embed/jkBfGvb7NzM", director: "director", genre: "genre", country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without genre' do
    movie = Movie.create(title:"movieTitle", video: "https://www.youtube.com/embed/jkBfGvb7NzM", director: "director", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without release date' do
    movie = Movie.create(title:"movieTitle", video: "https://www.youtube.com/embed/jkBfGvb7NzM", director: "director", duration: 99, country: "country", genre: "genre", poster: "posterLink.jpg", summary: "This is the movie summary", restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie without summary' do
    movie = Movie.create(title:"movieTitle", video: "https://www.youtube.com/embed/jkBfGvb7NzM", director: "director", duration: 99, country: "country", genre: "genre", poster: "posterLink.jpg", release_date: Date.new(2020,11,12), restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie with the same title' do
    movie1 = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", video: "https://www.youtube.com/embed/jkBfGvb7NzM", summary: "This is the movie summary", restrictions: "R")
    movie1.save
    assert movie1.valid?

    movie2 = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", video: "https://www.youtube.com/embed/jkBfGvb7NzM", summary: "This is the movie summary", restrictions: "R")
    movie2.save
    refute movie2.valid?
  end

  test 'should not save movie without poster' do
    movie2 = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), summary: "This is the movie summary", restrictions: "R")
    movie2.save
    refute movie2.valid?
  end

  test 'should get all the movies with release date after today' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2021,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    movie = Movie.create(title:"movieTitle2", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,9), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    movie = Movie.create(title:"movieTitle3", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2021,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save

    movies = Movie.release_after(Date.today)

    assert movies.length() == 2

  end

  test 'should get all the movies with release date before today' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.today - 4, poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    movie = Movie.create(title:"movieTitle2", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.today + 10, poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    movie = Movie.create(title:"movieTitle3", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.today - 4, poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save

    released_movies = Movie.release_before(Date.today)
    assert released_movies.length() == 4
  end

  test 'should not save movie with incorrect duration' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: -1, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    refute movie.valid?

    movie.duration = 120.4
    movie.save
    refute movie.valid?
  end

  test 'should not save movie with incorrect restrictions' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 1, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "D")
    movie.save
    refute movie.valid?

    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 1, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "PG-13")
    movie.save
    assert movie.valid?
  end

  test 'should not save movie with incorrect video link' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 12, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/sdakkdas", restrictions: "R")
    movie.save
    refute movie.valid?

    movie.video = "www.youtube.com/embed/sdakkdas"
    movie.save
    refute movie.valid?
  end

  test 'should not save movie with incorrect poster link' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 12, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.j", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/sdakkdas", restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie with invalid directors' do
    movie = Movie.create(title:"movieTitle", director: "director123", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    refute movie.valid?
  end

  test 'should not save movie with invalid actors' do
    movie = Movie.create(title:"movieTitle", director: "director", genre: "genre", duration: 99, country: "country", release_date: Date.new(2020,11,12), poster: "posterLink.jpg", summary: "This is the movie summary", actors: "Actors123", video: "https://www.youtube.com/embed/jkBfGvb7NzM", restrictions: "R")
    movie.save
    refute movie.valid?
  end





end
