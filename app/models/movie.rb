class Movie < ApplicationRecord
    ### Scopes:
    # Filters the movies that have been already released
    scope :release_before, -> (date) {
      where("release_date <= ?", date)
    }
    # Filters the movies that are yet to be released
    scope :release_after, -> (date) {
      where("release_date > ?", date)
    }

    ### Associations:
    has_many :screenings, dependent: :destroy

    ### Validations:
    # Checks whether the fields are not null
    validates :title, :restrictions, :genre, :duration, :release_date, :video, :poster, :summary, presence: true
    # Checks whether the movie title is unique
    validates :title, uniqueness: true
    # Checks whether the director is only letters and spaces (and if more directors added, commas)
    validates :director, format: { with:/\A[a-zA-Z, ]*\z/, message: "The directors have to be composed only of letters and spaces (and commas if more than 1)"}
    # Checks whether the actors are only letters and spaces (and if more actors added, commas)
    validates :actors, format: { with: /\A[a-zA-Z, ]*\z/, message: "The actors have to be composed only of letters and spaces (and commas if more than 1)"}
    # Checks if durations is a positive integer
    validates :duration, numericality: { only_integer: true, greater_than: 0}
    # Validates that the ending of the poster input is .jpg, .png or .gif
    validates :poster, format: {with: /\A(.)+\.(jpg|png|gif)\z/, message: "The link has to be valid png, gif or jpg file."}
    # Regex expression which verifies whether the link is youtube embedded link (e.g. https://www.youtube.com/embed/jkBfGvb7NzM)
    validates :video, format: {with: /\A(https:\/\/www.youtube.com\/embed\/\w+)\z/, message: "The youtube embedded link is invalid."}
    # Checks if the restrictions are included in Motion Picture Association film rating system
    validates :restrictions, inclusion: { in: %w(N/A R G PG PG-13 NC-17), message: "Not a valid restrictions."}

end
