class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, foreign_key: true, index:true, null:false
      t.string :movie_title,  null:false
      t.date :booked_date,    null:false
      t.string :booked_time,  null:false
      t.integer :quantity,    null:false
      t.string :cinema,       null:false
      t.string :arena,        null:false
      t.decimal :total_price, null:false

      t.timestamps
    end
  end
end
