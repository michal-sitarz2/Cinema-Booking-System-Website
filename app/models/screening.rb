class Screening < ApplicationRecord
  has_one :movie
  has_one :cinema

  validates :price, :screening_time, :screening_date, :arena, :available_seats, presence: true

end
