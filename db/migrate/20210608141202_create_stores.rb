class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :name, null: false
      t.integer :pachinko_num, null: false
      t.integer :slot_num, null: false
      t.integer :code, null: false

      t.timestamps
    end
  end
end
