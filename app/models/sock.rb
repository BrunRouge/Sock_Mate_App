class Sock < ApplicationRecord
  belongs_to :user
  validates :textile, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :price, presence: true
end
