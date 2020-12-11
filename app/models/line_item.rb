class LineItem < ApplicationRecord

  ### Associations:
  # The items belong to the cart (multiple items can belong to the same cart)
  belongs_to :cart
  # Defines a many-to-many relationship between screenings and carts
  belongs_to :screening

  ### Valdiations:
  # Checks if the cart exists
  validates :cart, :screening, presence: true

  # A method to calculate the total price of the item
  def total_price
    # Calculated by multiplying the quantity of the item in the cart and the price of the item
    screening.price * quantity
  end

end
