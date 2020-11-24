class AddScreeningRefToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :screening, index: true, foreign_key: true
  end
end
