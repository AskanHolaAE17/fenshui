class AddAnswerToOrderNonSector < ActiveRecord::Migration[5.0]
  def change
    add_column :order_non_sectors, :answer, :text
  end
end
