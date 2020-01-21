class CreateSocks < ActiveRecord::Migration[5.2]
  def change
    create_table :socks do |t|
      t.integer :size
      t.monetize :price, amount: { null: false, default: 0 }
      t.string :textile
      t.string :color
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
