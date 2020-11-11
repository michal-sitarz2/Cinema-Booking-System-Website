class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :genre
      t.integer :duration
      t.integer :year
      t.string :country
      t.date :release_date
      t.string :poster
      t.text :summary
      t.string :actors

      t.timestamps
    end
  end
end
