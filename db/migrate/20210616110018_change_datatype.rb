class ChangeDatatype < ActiveRecord::Migration[6.1]
  def up
    change_column :machines, :place, :text
  end
  
  def downくく
    change_column :machines, :place, :text
  end
end
