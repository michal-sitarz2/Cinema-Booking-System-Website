class Booking < ApplicationRecord
  belongs_to :user
  validates :user, :movie_title, :booked_date, :booked_time, :quantity, :cinema, :arena, :total_price, presence: true

end
