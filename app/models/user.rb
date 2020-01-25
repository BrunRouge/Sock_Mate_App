class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :socks
  has_many :bookings
  monetize :funds_cents, numericality: { greater_than_or_equal_to: 0 }

  def acquired_count_increase
    self.socks_acquired += 1
  end
end
