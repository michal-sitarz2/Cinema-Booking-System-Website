class ChangeMovieTable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :movies, :video, false
    change_column :movies, :restrictions, :string, default: "N/A"
  end
end
