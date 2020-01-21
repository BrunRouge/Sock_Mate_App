class AddMonetizeFundsToUser < ActiveRecord::Migration[5.2]
  def change
    add_monetize :users, :funds, amount: { null: false, default: 10000 }
  end
end
