class AddNullToLineItems < ActiveRecord::Migration[5.2]
  def change
      change_column_null :line_items, :cart_id, false
      change_column_null :line_items, :screening_id, false
  end
end
