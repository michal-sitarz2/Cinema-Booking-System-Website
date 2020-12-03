class Screening < ApplicationRecord

  belongs_to :movie
  validates :price, :screening_date, :screening_time, :arena, :available_seats, presence: true

  def self.search(search)
    if search
      screenings = Screening.all
      screenings = screenings.where(cinema: search[:":cinema"])
      screenings = screenings.where(screening_date: search[:":screening_date"])
      return screenings
    else
      return []
    end
  end
end
