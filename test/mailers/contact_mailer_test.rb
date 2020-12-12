require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  test "should return contact email" do
    mail = ContactMailer.contact_email("matthew@me.com", "Matthew Casey", "1234567890", @message="Hello. I need more information about the screenings.")

    assert_equal ['info@mymovies.com'], mail.to
    assert_equal ['info@mymovies.com'], mail.from

  end



end
