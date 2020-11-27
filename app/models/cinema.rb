class Cinema < ApplicationRecord

  belongs_to :screening, optional: true

  validates :name, :location, presence: true
  validates :name, uniqueness: true

end
