class Screening < ApplicationRecord
  ### Scopes:
  # Filters the screenings on whether they have already been screened
  scope :screening_passed, -> {
    where("screening_date < ?", Date.today)
  }
  # Filters the screenings that have not yet screened
  scope :screening_upcoming, -> {
    where("screening_date >= ?", Date.today)
  }

  ### Associations:
  # The screening can have many line items, and if it belongs to one it cannot be destroyed
  has_many :line_items, dependent: :restrict_with_error
  belongs_to :movie

  ### Validations:
  # Checks whether the fields are not null
  validates :movie, :price, :screening_date, :cinema, :screening_time, :arena, :available_seats, presence: true
  # Checks if price is a positive number
  validates :price, numericality: { greater_than: 0 }
  # Checks if available seats is a positive integer
  validates :available_seats, numericality: { only_integer: true, greater_than: 0}
  # Checks if the screening type is within the avaiable movie screening type
  validates :screening_type, inclusion: { in: %w(2D 3D 4D), message: "Not a valid screening type. (2D, 3D, 4D, Extreme 2D)"}

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
