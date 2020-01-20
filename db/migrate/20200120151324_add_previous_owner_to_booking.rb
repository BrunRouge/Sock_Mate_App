class AddPreviousOwnerToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :previousowner_id, :integer
  end
end
