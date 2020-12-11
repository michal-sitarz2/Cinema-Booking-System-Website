class Cart < ApplicationRecord

  ### Associations:
  # A cart can have many items (screenings) and many screenings can be in a cart
  # If a cart is destroyed the items will be destroyed as well (not from screenings database)
  has_many :line_items, dependent: :destroy
  # A cart has one user associated to it, and the user can add screenings to it
  has_one :user

  # Function used to add items to the cart
  def add_item(screening)
    # Checks if the item is already in the cart
    current_item = line_items.find_by(screening_id: screening)

    # If the item is already in the cart, the quantity of the item will be incremented
    if current_item
      current_item.increment(:quantity)
    # Otherwise the item will be created with the passed screening
    else
      current_item = line_items.build(screening_id: screening.id)
    end
    current_item
  end

  # A method used to calculate the total price of the cart
  def total_price
    # Sums up total price of all the items in the cart
    line_items.to_a.sum { |item| item.total_price}
  end

  # A method used to calculate the total quantity of the cart
  def total_quantity
    # Sums up total quantity of all the items in the cart
    line_items.to_a.sum { |item| item.quantity}
  end

end
