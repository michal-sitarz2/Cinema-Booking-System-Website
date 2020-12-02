class AddColumnsToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :actors, :string
    add_column :movies, :video, :string
    add_column :movies, :restrictions, :string
  end
end
