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
  validates :screening_type, inclusion: { in: %w(2D 3D 4D), message: "#{I18n.t('messages.validations.screening_type')}"}


  # A method used to search for specific screenings based on the date and cinema it plays in
  def self.search(search)
    # If parameters defined
    if search
      screenings = Screening.all
      # Filters the screenings based on the cinema played in
      screenings = screenings.where(cinema: search[:":cinema"])
      # Filters the filtered screenings based on the screening date passed in the parameter (search)
      screenings = screenings.where(screening_date: search[:":screening_date"])
      # Returns filtered screenings
      return screenings
    # If there are no parameters
    else
      return []
    end
  end
end
