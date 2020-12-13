require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Cinema Town'
    assert_select 'h2', 'Currently in Cinemas'
    assert_select 'h2', 'Upcoming Movies'

  end

  test "should get resource table" do
    get '/users/sign_in'
    sign_in users(:users_001)
    post user_session_url

    get allresources_url
    assert_response :success

    assert_select 'title', 'Cinema Town'
    assert_select 'h2', 'Movies'
    assert_select 'h2', 'Screenings'
    assert_select 'h2', 'Cinemas'
    assert_select 'h2', 'Bookings'
  end

  test 'should get book tickets' do
    get '/booking'
    assert_response :success

    assert_select 'title', 'Cinema Town'
    assert_select 'h2', 'Currently Screening'
    assert_select 'h3', 'Search By:'
  end


  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Cinema Town'
    assert_select 'h1', 'Get in Touch'
    assert_select 'p', 'Please fill in the following form and we will be in touch shortly.'
  end

  test "should post request contact but no email" do
    post request_contact_url

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post request_contact_url, params:
      {name: "Matthew", email:"matthew@me.com", telephone: "1234567890", message: "Hello"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end


end
