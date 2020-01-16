class Sock < ApplicationRecord
  belongs_to :user
  validates :textile, presence: true
  validates :color, presence: true
  validates :size, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
end
