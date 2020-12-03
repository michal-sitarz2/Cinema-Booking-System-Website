class Movie < ApplicationRecord

    has_many :screenings, dependent: :destroy

    validates :title, :genre, :duration, :release_date, :poster, :summary, presence: true
    validates :title, uniqueness: true

end
