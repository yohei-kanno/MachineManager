class AddIndexCodeToStores < ActiveRecord::Migration[6.1]
  def change
    add_index :stores, :code, unique: true
  end
end
