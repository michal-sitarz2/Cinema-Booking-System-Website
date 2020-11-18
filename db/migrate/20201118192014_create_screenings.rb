class CreateScreenings < ActiveRecord::Migration[5.2]
  def change
    create_table :screenings do |t|
      t.integer :num_seats,   null: false
      t.integer :num_sold,    default: 0
      t.date :screening_date, null: false
      t.time :screening_time, null: false
      t.string :arena,        null: false
      t.decimal :price,          null: false

      t.timestamps            null: false
    end
  end
end
