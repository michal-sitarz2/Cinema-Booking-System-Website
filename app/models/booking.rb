class Booking < ApplicationRecord

  ### Scopes:
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

  ### Associations:
  # Booking is associated to a user
  # A user can have multiple bookings
  belongs_to :user

  ### Valdiations:
  # Checks if all the fields are defined
  validates :user, :movie_title, :booked_date, :booked_time, :quantity, :cinema, :arena, :total_price, presence: true

end
