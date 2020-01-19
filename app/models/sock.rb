class Sock < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :textile, presence: true
  validates :color, presence: true
  validates :size, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
