class CreateScreenings < ActiveRecord::Migration[5.2]
  def change
    create_table :screenings do |t|
      t.decimal :price,           null:false
      t.time :screening_time,     null:false
      t.date :screening_date,     null:false
      t.string :arena,            null:false
      t.integer :available_seats, null:false
      t.string :cinema,           null:false
      t.integer :sold_seats,      default:0

      t.belongs_to :movie, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
