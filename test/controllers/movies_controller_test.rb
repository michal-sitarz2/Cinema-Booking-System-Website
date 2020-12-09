require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)

    get '/users/sign_in'
    sign_in users(:users_001)
    post user_session_url
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: {genre: @movie.genre, duration: @movie.duration, release_date: @movie.release_date, poster: @movie.poster, summary: @movie.summary, title: @movie.title + " create"} }
    end

    assert_redirected_to allresources_url
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { country: @movie.country, director: @movie.director, duration: @movie.duration, genre: @movie.genre, poster: @movie.poster, release_date: @movie.release_date, summary: @movie.summary, title: @movie.title } }
    assert_redirected_to allresources_url
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to allresources_url
  end
end
