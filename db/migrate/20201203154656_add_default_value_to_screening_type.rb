class AddDefaultValueToScreeningType < ActiveRecord::Migration[5.2]
  def change
    change_column_default :screenings, :screening_type, "2D"
  end
end
