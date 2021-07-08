class ChangeDataStores < ActiveRecord::Migration[6.1]
  def up
    change_column :stores, :code, :string
  end
  
  def down
    change_column :stores, :code, :integer
  end
end
