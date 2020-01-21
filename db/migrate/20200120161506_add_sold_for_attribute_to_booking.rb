class AddSoldForAttributeToBooking < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bookings, :sellprice, amount: { null: false, default: 0 }
  end
end
