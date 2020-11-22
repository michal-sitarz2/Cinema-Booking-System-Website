class Movie < ApplicationRecord

    has_many :actors, dependent: :destroy
  #  belongs_to :screening

    validates :title, :genre, :duration, :release_date, :summary, presence: true
    validates :title, uniqueness: true

end
