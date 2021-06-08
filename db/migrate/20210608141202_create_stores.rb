class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :number_of_pachinko_machines
      t.integer :number_of_slot_machines
      t.integer :store_code

      t.timestamps
    end
  end
end
