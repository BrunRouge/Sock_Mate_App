class AddMonetizeFundsToUser < ActiveRecord::Migration[5.2]
  def change
    add_monetize :users, :funds, currency: { present: false }, amount: { null: false, default: 10000 }
  end
end
