class AddScreeningRefToCinemas < ActiveRecord::Migration[5.2]
  def change
    add_reference :cinemas, :screening, index: true, foreign_key: true
  end
end
