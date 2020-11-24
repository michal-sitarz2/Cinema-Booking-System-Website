class Screening < ApplicationRecord
  has_one :movie

  validates :price, :screening_time, :screening_date, :arena, :available_seats, presence: true
end
