class Booking < ApplicationRecord

  # Filter Bookings based on their respecitve owners/users
  scope :find_user, -> (user) {
    where(user_id: user)
  }

  # Filters the bookings in the future
  scope :booking_upcoming, -> {
    where("booked_date >= ?", Date.today)
  }

  # Filters the bookings history
  scope :booking_history, -> {
    where("booked_date < ?", Date.today)
  }


  belongs_to :user
  validates :user, :movie_title, :booked_date, :booked_time, :quantity, :cinema, :arena, :total_price, presence: true

end
