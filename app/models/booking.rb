class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sock
  has_many :previous_owners
end
