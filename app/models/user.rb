class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :funds, numericality: { greater_than_or_equal_to: 0 }
  has_many :socks
  has_many :bookings
end
