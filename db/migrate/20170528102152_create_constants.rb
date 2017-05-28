class CreateConstants < ActiveRecord::Migration[5.0]
  def change
    create_table :constants do |t|
      t.string :title
      t.string :value
    end
  end
end
