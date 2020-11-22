class Cinema < ApplicationRecord

#  belongs_to :screening

  validates :name, :location, presence: true
  validates :name, uniqueness: true

end
