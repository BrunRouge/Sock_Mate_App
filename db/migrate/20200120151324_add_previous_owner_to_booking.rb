class AddPreviousOwnerToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :previousowner, :integer
  end
end
