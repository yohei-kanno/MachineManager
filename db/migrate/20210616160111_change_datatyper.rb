class ChangeDatatyper < ActiveRecord::Migration[6.1]
  def up
    change_column :machines, :place, :string
  end
  
  def down
    change_column :machines, :place, :string
  end
end
