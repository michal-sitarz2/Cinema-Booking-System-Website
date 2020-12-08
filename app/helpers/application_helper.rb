module ApplicationHelper

  def cart_count_over_one
    if @cart.line_items.count > 0
      counter = 0
      @cart.line_items.each do |item|
        counter+=item.quantity
      end
      return counter
    end
  end

  def cart_has_items
    return @cart.line_items.count > 0
  end

end
