class Screening < ApplicationRecord

  # Filters the screenings on whether they have already been screened
  scope :screening_passed, -> {
    where("screening_date < ?", Date.today)
  }

  # Filters the screenings that have not yet screened
  scope :screening_upcoming, -> {
    where("screening_date >= ?", Date.today)
  }

  belongs_to :movie
  validates :movie, :price, :screening_date, :cinema, :screening_time, :arena, :available_seats, presence: true

  has_many :line_items, dependent: :restrict_with_error

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
