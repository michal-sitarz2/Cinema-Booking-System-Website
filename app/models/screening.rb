class Screening < ApplicationRecord

  belongs_to :movie

  validates :price, :screening_date, :screening_time, :arena, :available_seats, presence: true

end
