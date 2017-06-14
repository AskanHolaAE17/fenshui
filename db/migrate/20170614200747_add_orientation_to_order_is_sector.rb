class AddOrientationToOrderIsSector < ActiveRecord::Migration[5.0]
  def change
    add_column :order_is_sectors, :orientation, :string
  end
end
