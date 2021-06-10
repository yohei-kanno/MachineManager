class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :pachinko_num
      t.integer :slot_num
      t.integer :store_code

      t.timestamps
    end
  end
end
