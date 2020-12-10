class Movie < ApplicationRecord

    # Filters the movies that have been already released
    scope :release_before_today, -> {
      where("release_date <= ?", Date.today)
    }
    # Filters the movies that are yet to be released
    scope :release_after_today, -> {
      where("release_date > ?", Date.today)
    }

    has_many :screenings, dependent: :destroy

    validates :title, :genre, :duration, :release_date, :poster, :summary, presence: true
    validates :title, uniqueness: true

end
