class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title,      null: false
      t.string :director
      t.string :genre,      null: false
      t.integer :duration,  null: false
      t.string :country
      t.date :release_date, null: false
      t.string :poster
      t.text :summary,      null: false

      t.timestamps null: false
    end
  end
end
