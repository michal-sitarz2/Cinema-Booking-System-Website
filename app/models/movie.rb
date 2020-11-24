class Movie < ApplicationRecord
    belongs_to :screening
    has_many :actors, dependent: :destroy
    
    validates :title, :genre, :duration, :release_date, :summary, presence: true
    validates :title, uniqueness: true

end
