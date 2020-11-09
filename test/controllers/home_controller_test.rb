require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Cinema Town'
    assert_select 'h1', 'Cinema Town'
    assert_select 'p', 'Welcome to Cinema Booking website.'

  end

end
