class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :screening

  def total_price
    screening.price * quantity
  end

end
