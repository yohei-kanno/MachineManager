class ChangeDatatype < ActiveRecord::Migration[6.1]
  def change
    change_column :machines, :place, :text
  end
end
