class AddStatusToSock < ActiveRecord::Migration[5.2]
  def change
    add_column :socks, :status, :string, :default => "active"
  end
end
