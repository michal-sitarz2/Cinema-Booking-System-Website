require 'test_helper'

class CinemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cinema = cinemas(:one)

    get '/users/sign_in'
    sign_in users(:users_001)
    post user_session_url
  end

  test "should get index" do
    get cinemas_url
    assert_response :success
  end

  test "should get new" do
    get new_cinema_url
    assert_response :success
  end

  test "should create cinema" do
    assert_difference('Cinema.count') do
      post cinemas_url, params: { cinema: { address: @cinema.address, name: @cinema.name + " create", image: @cinema.image} }
    end

    assert_redirected_to allresources_url
  end

  test "should get edit" do
    get edit_cinema_url(@cinema)
    assert_response :success
  end

  test "should update cinema" do
    patch cinema_url(@cinema), params: { cinema: { address: @cinema.address, name: @cinema.name } }
    assert_redirected_to allresources_url
  end

  test "should destroy cinema" do
    assert_difference('Cinema.count', -1) do
      delete cinema_url(@cinema)
    end

    assert_redirected_to allresources_url
  end
end
