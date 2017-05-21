class CreateOrderIsSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :order_is_sectors do |t|
      t.integer :user_id
      t.boolean :payed, default: false
      t.string :sector
      t.integer :sector_id
      t.decimal :price
      t.decimal :exchange_rate
      t.decimal :currency
      t.string :akey
      t.string :akey_primary
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
