class AddBirthdayToOrderIsSector < ActiveRecord::Migration[5.0]
  def change
    add_column :order_is_sectors, :birthday, :datetime
  end
end
