require 'test_helper'

class CartTest < ActiveSupport::TestCase

  setup do
    @user = users(:users_001)
    @screening = screenings(:one)
  end

  test 'should create valid cart' do
    cart = Cart.create(user_id: @user.id)
    cart.save
    assert cart.valid?
  end

  test 'should add item to cart' do
    cart = Cart.create(user_id: @user.id)
    cart.save

    refute cart.line_items.first()

    cart.add_item(@screening)
    assert cart.line_items.first()
  end

  test 'should get valid total price for the same screening' do
    cart = Cart.create(user_id: @user.id)
    cart.save

    cart.add_item(@screening)
    cart.add_item(@screening)
    assert cart.total_price == (@screening.price * 2)
  end

  test 'should get valid total price for the different screenings' do
    screening_2 = screenings(:two)

    cart = Cart.create(user_id: @user.id)
    cart.save

    cart.add_item(@screening)
    cart.add_item(screening_2)
    assert cart.total_price == (@screening.price + screening_2.price)
  end

  test 'should get total quantity' do
    cart = Cart.create(user_id: @user.id)
    cart.save

    cart.add_item(@screening)
    cart.add_item(@screening)
    assert cart.total_quantity == 2
  end

end
