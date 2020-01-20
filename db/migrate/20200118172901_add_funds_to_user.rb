class AddFundsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :funds, :integer, :default => 10000
  end
end
