class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.integer :pachinko_num, null: false
      t.integer :slot_num, null: false
      t.integer :code, null: false

      t.timestamps
    end
  end
end
