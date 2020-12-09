require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
    @user = users(:users_001)

    get '/users/sign_in'
    sign_in users(:users_001)
    post user_session_url
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: { user_id: @user.id } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: { user_id: @user.id  } }
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to root_path
  end
end
