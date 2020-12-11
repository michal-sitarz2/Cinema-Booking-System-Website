module ApplicationHelper

  def cart_count_over_one
    # Checks if there is anything in the cart
    if @cart.line_items.count > 0
      counter = 0
      # Counts the quantity of the items to display a total value in the cart
      @cart.line_items.each do |item|
        counter+=item.quantity
      end
      return counter
    end
  end

# Checks if cart is not empty
  def cart_has_items
    return @cart.line_items.count > 0
  end

end
