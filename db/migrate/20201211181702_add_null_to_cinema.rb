class AddNullToCinema < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cinemas, :image, false
  end
end
