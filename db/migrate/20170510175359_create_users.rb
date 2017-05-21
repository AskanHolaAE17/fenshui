class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :active, default: true
      t.string :name
      t.string :email
      t.decimal :sum
      t.datetime :birthday
      t.string :akey
      t.string :akey_primary

      t.timestamps
    end
  end
end
