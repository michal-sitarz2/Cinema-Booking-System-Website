class CreateScreenings < ActiveRecord::Migration[5.2]
  def change
    create_table :screenings do |t|
      t.decimal :price,           null:false
      t.time :screening_time,     null:false
      t.date :screening_date,     null:false
      t.string :arena,            null:false
      t.integer :available_seats, null:false

      t.timestamps null: false
    end
  end
end
