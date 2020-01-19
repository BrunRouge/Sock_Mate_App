class AddFundsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :funds, :integer, :default => 100
  end
end
