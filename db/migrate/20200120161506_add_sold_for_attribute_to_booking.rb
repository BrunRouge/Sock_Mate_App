class AddSoldForAttributeToBooking < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bookings, :sold_for
  end
end
