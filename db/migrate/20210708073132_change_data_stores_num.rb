class ChangeDataStoresNum < ActiveRecord::Migration[6.1]
  def up
    change_column :stores, :pachinko_num, :string
    change_column :stores, :slot_num, :string
  end
  
  def down
    change_column :stores, :pachinko_num, :integer
    change_column :stores, :slot_num, :integer
  end
end
