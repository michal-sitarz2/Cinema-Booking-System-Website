require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should save valid user' do
    user = User.new
    user.email = 'john@example.com'
    user.password = "123456"
    user.save
    assert user.valid?
  end

  test 'should not save user without email' do
    user = User.new
    user.password = "123456"
    user.save
    refute user.valid?
  end

  test 'should not save user without password' do
    user = User.new
    user.email = 'john@example.com'
    user.save
    refute user.valid?
  end

  test 'admin should be false if not specified otherwise' do
    user = User.new
    user.email = 'john@example.com'
    user.password = "123456"
    user.save
    assert user.admin == false
  end

  test 'should save valid admin' do
    user = User.new
    user.email = 'john@example.com'
    user.password = "123456"
    user.admin = true
    user.save
    assert user.admin == true
  end
end
