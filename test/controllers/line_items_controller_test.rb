require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
    @cart = carts(:one)
    @screenings = screenings(:one)

    get '/users/sign_in'
    sign_in users(:users_001)
    post user_session_url
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { line_item: { cart_id: @cart[:id], screening_id: @screening[:id] } }
    end

    assert_redirected_to line_item_url(LineItem.last)
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, screening_id: @line_item.screening_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end
