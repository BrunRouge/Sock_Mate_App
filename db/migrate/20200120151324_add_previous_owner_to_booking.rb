class AddPreviousOwnerToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :previous_owner, :user
  end
end
