class Actor < ApplicationRecord

  belongs_to :movie
  validates  :name, :movie, presence: true

end
