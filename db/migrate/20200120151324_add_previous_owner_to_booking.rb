class AddPreviousOwnerToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :previousowner_id, :integer
    add_monetize :bookings, :sellprice, amount: { null: false, default: 0 }
  end
end
