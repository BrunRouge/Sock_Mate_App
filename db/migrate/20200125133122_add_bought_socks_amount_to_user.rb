class AddBoughtSocksAmountToUser < ActiveRecord::Migration[5.2]
 def change
    add_column :users, :socks_acquired, :integer, :default => 0
  end
end
