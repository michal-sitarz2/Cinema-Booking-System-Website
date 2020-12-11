class Movie < ApplicationRecord
    # Filters the movies that have been already released
    scope :release_before, -> (date) {
      where("release_date <= ?", date)
    }
    # Filters the movies that are yet to be released
    scope :release_after, -> (date) {
      where("release_date > ?", date)
    }

    has_many :screenings, dependent: :destroy

    validates :title, :genre, :duration, :release_date, :poster, :summary, presence: true
    validates :title, uniqueness: true

end
