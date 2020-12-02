class AddTypeToScreenings < ActiveRecord::Migration[5.2]
  def change
    add_column :screenings, :screening_type, :string
  end
end
