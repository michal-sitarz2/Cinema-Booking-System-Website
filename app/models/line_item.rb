class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :screening

  validates :cart, :screening, presence: true

  def total_price
    screening.price * quantity
  end

end
