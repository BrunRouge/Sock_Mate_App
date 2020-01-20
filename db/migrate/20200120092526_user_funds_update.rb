class UserFundsUpdate < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :funds, :integer, :default => 10000
  end
end
