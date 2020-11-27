class Screening < ApplicationRecord
  has_one :movie
  has_one :cinema

  validates :movie, :cinema, :price, :screening_time, :arena, :available_seats, presence: true

end
