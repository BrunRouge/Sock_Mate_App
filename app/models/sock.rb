class Sock < ApplicationRecord
  ALLOWED_STATUSES = %w[active hidden].freeze
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :textile, presence: true
  validates :color, presence: true
  validates :size, presence: true, numericality: { only_integer: true }
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES }

  def active!
    self.update!(status: 'active')
  end
  def hidden!
    self.update!(status: 'hidden')
  end
end
