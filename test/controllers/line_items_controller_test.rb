require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:three)
    @cart = carts(:one)
    @screenings = screenings(:one)

    get '/users/sign_in'
    sign_in users(:users_003)
    post user_session_url
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url(line_item: {screening_id: @screenings.id})
    end

    assert_redirected_to screenings_url(screening: {screening_date: @screenings.screening_date, cinema: @screenings.cinema})
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to '/booking'
  end
end
