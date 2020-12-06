require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Cinema Town'
    assert_select 'h2', 'Cinema Program'
    assert_select 'a', 'All the available movies'

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
