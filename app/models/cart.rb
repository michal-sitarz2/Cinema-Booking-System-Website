class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_item(screening)
    current_item = line_items.find_by(screening_id: screening)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(screening_id: screening.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end

  def total_quantity
    line_items.to_a.sum { |item| item.quantity}
  end

end
