class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sock
  monetize :sellprice_cents, numericality: { greater_than_or_equal_to: 0 }
end
