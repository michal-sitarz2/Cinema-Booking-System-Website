require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  setup do
    @screening = screenings(:one)
    @cart = carts(:one)
  end

  test 'should save valid item' do
    item = LineItem.create(cart_id: @cart.id, screening_id: @screening.id, quantity: 2)
    item.save
    assert item.valid?
  end

  test 'should not save item without cart' do
    item = LineItem.create(screening_id: @screening.id, quantity: 2)
    item.save
    refute item.valid?
  end

  test 'should not save item without screening' do
    item = LineItem.create(cart_id: @cart.id, quantity: 2)
    item.save
    refute item.valid?
  end

  test 'should get default value of quantity if not defined' do
    item = LineItem.create(cart_id: @cart.id, screening_id: @screening.id)
    item.save
    assert item.quantity==1
  end

  test 'should delete items if cart destroyed' do
    @cart.save

    item = LineItem.create(cart_id: @cart.id, screening_id: @screening.id)
    item.save
    assert LineItem.find_by(id: item.id)

    @cart.destroy
    refute LineItem.find_by(id: item.id)
  end

  test 'should get expected total price' do
    item = LineItem.create(cart_id: @cart.id, screening_id: @screening.id, quantity: 3)
    item.save

    total_price = 3 * @screening.price
    assert total_price == item.total_price
  end


end
