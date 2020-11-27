class RemoveScreeningDateFromScreenings < ActiveRecord::Migration[5.2]
  def change
    remove_column :screenings, :screening_date, :date
  end
end
