class Cinema < ApplicationRecord

  ### Validations:
  # Check if the fields are present
  validates :name, :address, :image, presence: true
  # Checks if the name of the cinema is unique
  validates :name, uniqueness: true
  # Validates that the ending of the image input is .jpg, .png or .gif
  validates :image, format: {with: /\A(.)+\.(jpg|png|gif)\z/, message: "The link has to be valid png, gif or jpg file."}

end
