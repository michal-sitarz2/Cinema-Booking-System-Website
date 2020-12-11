class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ### Associations:
  # A user can make many bookings
  # Once a user is deleted, all the corresponding bookings will be destroyed as well
  has_many :bookings, dependent: :destroy
  # A cart is associated to a user, but a user can be created without a cart
  belongs_to :cart, optional: true
end
