class Movie < ApplicationRecord

    has_many :screenings, dependent: :destroy
    has_many :actors, dependent: :destroy

    validates :title, :genre, :duration, :release_date, :summary, presence: true
    validates :title, uniqueness: true

end
